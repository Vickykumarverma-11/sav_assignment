import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class GradientBorderContainer extends StatelessWidget {
  const GradientBorderContainer({
    super.key,
    required this.child,
    required this.borderRadius,
    this.gradient = AppColors.borderGradient,
    this.borderWidth = 1.0,
  });

  final Widget child;
  final double borderRadius;
  final Gradient gradient;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
