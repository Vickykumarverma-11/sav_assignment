import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class FadedDivider extends StatelessWidget {
  const FadedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.dividerFaded,
            AppColors.dividerFaded,
            Colors.transparent,
          ],
          stops: [0.0, 0.25, 0.75, 1.0],
        ),
      ),
    );
  }
}
