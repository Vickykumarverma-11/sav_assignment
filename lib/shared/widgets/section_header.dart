import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/spacing.dart';
import '../../core/theme/text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.iconAsset,
    this.iconContainerColor = AppColors.primary,
    this.iconColorFilter,
    this.iconSize = 10.0,
    this.gap = AppSpacing.sm,
    this.titleFontSize = 14.0,
    this.titleWeight = 550.0,
    this.titleColor = AppColors.textPrimary,
  });

  final String title;
  final String iconAsset;
  final Color iconContainerColor;
  final ColorFilter? iconColorFilter;
  final double iconSize;
  final double gap;
  final double titleFontSize;
  final double titleWeight;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: iconContainerColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconAsset,
                  width: iconSize,
                  height: iconSize,
                  colorFilter: iconColorFilter,
                ),
              ),
            ),
            SizedBox(width: gap),
            Text(
              title,
              style: AppTextStyles.dmSans(
                weight: titleWeight,
                fontSize: titleFontSize,
                color: titleColor,
              ),
            ),
          ],
        ),
        SvgPicture.asset(AppAssets.bracket, width: 18, height: 18),
      ],
    );
  }
}
