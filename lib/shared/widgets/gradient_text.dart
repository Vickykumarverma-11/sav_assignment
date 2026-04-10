import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.style,
    this.gradient,
  });

  final String text;
  final TextStyle style;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          (gradient ?? AppColors.primaryGradient).createShader(bounds),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}
