import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/stock_graph_widget.dart';
import '../widgets/stock_header_widget.dart';
import '../widgets/stock_price_widget.dart';
import '../widgets/time_filter_tabs.dart';

class StockCard extends StatelessWidget {
  const StockCard({super.key});

  static const double _iconSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _iconSize / 2),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardSurface,
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x405B9A74), // AppColors.greenLight ~25% opacity
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: _iconSize / 2 + AppSpacing.sm),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      0,
                      AppSpacing.lg,
                      AppSpacing.sm,
                    ),
                    child: Center(child: StockHeaderNameWidget()),
                  ),

                  Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(painter: _DotGridPainter()),
                      ),
                      Container(
                        color: AppColors.cardGraphArea.withValues(alpha: 0.6),
                        child: const Column(
                          children: [
                            SizedBox(height: AppSpacing.md),
                            StockPriceWidget(),
                            SizedBox(height: AppSpacing.sm),
                            StockGraphWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      AppSpacing.md,
                      AppSpacing.lg,
                      AppSpacing.lg,
                    ),
                    child: const TimeFilterTabs(),
                  ),
                ],
              ),
            ),
          ),
        ),

        const Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(child: StockIconWidget()),
        ),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.dotGrid
      ..style = PaintingStyle.fill;

    const spacing = 14.0;
    const dotRadius = 1.0;
    final cols = (size.width / spacing).ceil() + 1;
    final rows = (size.height / spacing).ceil() + 1;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        canvas.drawCircle(Offset(c * spacing, r * spacing), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter old) => false;
}
