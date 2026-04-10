import 'package:flutter/material.dart';

import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';

class StockGraphWidget extends StatelessWidget {
  const StockGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: CustomPaint(
        painter: _StockLinePainter(
          dataPoints: StockMockData.priceHistory,
          dotIndex: StockMockData.graphDotIndex,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _StockLinePainter extends CustomPainter {
  _StockLinePainter({required this.dataPoints, required this.dotIndex});

  final List<double> dataPoints;
  final int dotIndex;

  static const _graphGradient = AppColors.graphGradient;

  late final Paint _linePaint = Paint()
    ..strokeWidth = 1.8
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  late final Paint _dotOuterPaint = Paint()..color = Colors.white;

  late final Paint _dotInnerPaint = Paint()..style = PaintingStyle.fill;

  final Paint _dashedPaint = Paint()
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.length < 2) return;

    final points = _toCanvasPoints(dataPoints, size);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    _linePaint.shader = _graphGradient.createShader(rect);

    final visiblePoints = points.sublist(0, dotIndex + 1);
    _drawSpline(canvas, visiblePoints, _linePaint);
    _drawDashedVertical(canvas, points[dotIndex], size);
    _drawDot(canvas, points[dotIndex], rect);
  }

  List<Offset> _toCanvasPoints(List<double> data, Size size) {
    final minVal = data.reduce((a, b) => a < b ? a : b);
    final maxVal = data.reduce((a, b) => a > b ? a : b);
    final range = (maxVal - minVal) == 0 ? 1.0 : maxVal - minVal;
    final pad = range * 0.18;

    final lo = minVal - pad;
    final hi = maxVal + pad;
    final span = hi - lo;

    return List.generate(data.length, (i) {
      final x = i / (data.length - 1) * size.width;
      final y = size.height * (1 - (data[i] - lo) / span);
      return Offset(x, y);
    });
  }

  void _drawSpline(Canvas canvas, List<Offset> pts, Paint paint) {
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);

    for (int i = 0; i < pts.length - 1; i++) {
      final p0 = i > 0 ? pts[i - 1] : pts[i];
      final p1 = pts[i];
      final p2 = pts[i + 1];
      final p3 = i < pts.length - 2 ? pts[i + 2] : p2;

      final cp1 = Offset(
        p1.dx + (p2.dx - p0.dx) / 6.0,
        p1.dy + (p2.dy - p0.dy) / 6.0,
      );
      final cp2 = Offset(
        p2.dx - (p3.dx - p1.dx) / 6.0,
        p2.dy - (p3.dy - p1.dy) / 6.0,
      );

      path.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, p2.dx, p2.dy);
    }

    canvas.drawPath(path, paint);
  }

  void _drawDashedVertical(Canvas canvas, Offset dotPos, Size size) {
    const dash = 6.0;
    const gap = 6.0;

    final dotFraction = (dotPos.dy / size.height).clamp(0.0, 1.0);

    _dashedPaint.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.greenDeep,
        AppColors.greenMid,
        AppColors.greenLight,
        AppColors.greenLight.withValues(alpha: 0),
      ],
      stops: [
        0.0,
        dotFraction * 0.6,
        dotFraction,
        (dotFraction + 0.35).clamp(0.0, 1.0),
      ],
    ).createShader(Rect.fromLTWH(dotPos.dx, 0, 2, size.height));

    var y = 0.0;
    while (y < size.height) {
      final end = (y + dash).clamp(0.0, size.height);
      canvas.drawLine(
        Offset(dotPos.dx, y),
        Offset(dotPos.dx, end),
        _dashedPaint,
      );
      y += dash + gap;
    }
  }

  void _drawDot(Canvas canvas, Offset pos, Rect gradientRect) {
    const ringColor = AppColors.greenLight;
    final rings = [(radius: 22.0, alpha: 0.08), (radius: 14.0, alpha: 0.15)];
    for (final ring in rings) {
      canvas.drawCircle(
        pos,
        ring.radius,
        Paint()
          ..color = ringColor.withValues(alpha: ring.alpha)
          ..style = PaintingStyle.fill,
      );
    }

    canvas.drawCircle(pos, 7.0, _dotOuterPaint);
    _dotInnerPaint.shader = _graphGradient.createShader(gradientRect);
    canvas.drawCircle(pos, 4.5, _dotInnerPaint);
  }

  @override
  bool shouldRepaint(_StockLinePainter old) =>
      old.dataPoints != dataPoints || old.dotIndex != dotIndex;
}
