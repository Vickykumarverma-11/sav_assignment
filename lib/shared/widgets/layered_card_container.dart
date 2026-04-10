import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import 'gradient_border_container.dart';

class LayeredCardContainer extends StatelessWidget {
  const LayeredCardContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 22.0,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  static const double _mainCardInset = 18.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 4,
              top: 16,
              bottom: -5,
              right: _mainCardInset * 2,
              child: Transform.rotate(angle: -0.08, child: _BackCard()),
            ),

            Positioned(
              left: _mainCardInset * 2,
              top: 10,
              bottom: -5,
              right: 7,
              child: Transform.rotate(angle: 0.04, child: _BackCard()),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: _mainCardInset),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: GradientBorderContainer(
                  borderRadius: borderRadius,
                  gradient: AppColors.cardBorderGradient,
                  child: Container(
                    width: double.infinity,
                    padding: padding,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius - 1),
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBack,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.cardBackBorder, width: 0.5),
      ),
    );
  }
}
