import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../shared/widgets/layered_card_container.dart';
import '../../../../shared/widgets/section_header.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontalLarge,
          ),
          child: SectionHeader(
            title: 'Insights',
            iconAsset: AppAssets.stroke,
            iconContainerColor: AppColors.primary,
            iconSize: 10,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        InsightsCard(),
      ],
    );
  }
}

class InsightsCard extends StatelessWidget {
  const InsightsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.cardHorizontal),
      child: LayeredCardContainer(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.md,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ReturnsRow(),
            SizedBox(height: AppSpacing.sm),
            _BarChart(),
            SizedBox(height: AppSpacing.md),
            _MetricsRow(),
          ],
        ),
      ),
    );
  }
}

class _ReturnsRow extends StatelessWidget {
  const _ReturnsRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Annual Returns', style: AppTextStyles.annualReturnLabel),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Avg. Vol.', style: AppTextStyles.avgVolLabel),
                const SizedBox(width: AppSpacing.xs),
                Text(StockMockData.avgVolume, style: AppTextStyles.avgVolValue),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        const _ReturnValue(),
      ],
    );
  }
}

class _ReturnValue extends StatelessWidget {
  const _ReturnValue();

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1F3822), Color(0xFF437A61), Color(0xFF5B9A74)],
    stops: [0.20, 0.80, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => _gradient.createShader(bounds),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StockMockData.annualReturn,
            style: AppTextStyles.annualReturnLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text('%', style: AppTextStyles.annualReturnSup),
          ),
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: CustomPaint(
        painter: _BarChartPainter(
          data: StockMockData.returnsDistribution,
          highlightIndex: 12,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _BarChartPainter extends CustomPainter {
  _BarChartPainter({required this.data, required this.highlightIndex});

  final List<double> data;
  final int highlightIndex;

  static const _lightBar = AppColors.chartBarLight;
  static const _darkBar = AppColors.chartBarDark;

  static const _barZone = 0.72;
  static const _reflectionZone = 0.28;

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    const barWidth = 6.0;
    final gap = (size.width - barWidth * data.length) / (data.length - 1);
    final barAreaHeight = size.height * _barZone;
    final reflectionAreaHeight = size.height * _reflectionZone;
    final barRadius = barWidth / 2;

    for (int i = 0; i < data.length; i++) {
      final barHeight = data[i] * barAreaHeight;
      final left = i * (barWidth + gap);
      final barTop = barAreaHeight - barHeight;

      final t = data[i].clamp(0.0, 1.0);
      final color = i == highlightIndex
          ? _darkBar
          : Color.lerp(_lightBar, _darkBar, t)!;

      final barRect = Rect.fromLTWH(left, barTop, barWidth, barHeight);

      final barPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color, color, color.withValues(alpha: 0.15)],
          stops: const [0.0, 0.55, 1.0],
        ).createShader(barRect)
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          barRect,
          topLeft: Radius.circular(barRadius),
          topRight: Radius.circular(barRadius),
          bottomLeft: const Radius.circular(1),
          bottomRight: const Radius.circular(1),
        ),
        barPaint,
      );

      final reflectionHeight = (barHeight * 0.30).clamp(
        0.0,
        reflectionAreaHeight,
      );
      final reflectionTop = barAreaHeight;
      final reflectionRect = Rect.fromLTWH(
        left,
        reflectionTop,
        barWidth,
        reflectionHeight,
      );

      final reflectionPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.20), color.withValues(alpha: 0.0)],
        ).createShader(reflectionRect)
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          reflectionRect,
          bottomLeft: Radius.circular(barRadius),
          bottomRight: Radius.circular(barRadius),
        ),
        reflectionPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_BarChartPainter old) =>
      old.data != data || old.highlightIndex != highlightIndex;
}

class _MetricsRow extends StatelessWidget {
  const _MetricsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _MetricItem(
            label: 'Market Cap',
            value: StockMockData.marketCap,
          ),
        ),
        Expanded(
          child: _MetricItem(label: 'P/E Ratio', value: StockMockData.peRatio),
        ),
        Expanded(
          child: _MetricItem(
            label: 'Div. Yield',
            value: StockMockData.divYield,
          ),
        ),
      ],
    );
  }
}

class _MetricItem extends StatelessWidget {
  const _MetricItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.metricLabel,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: AppTextStyles.metricValue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
