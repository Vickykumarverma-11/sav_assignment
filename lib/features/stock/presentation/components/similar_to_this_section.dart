import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../shared/widgets/section_header.dart';

class SimilarToThisHeader extends StatelessWidget {
  const SimilarToThisHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionHeader(
      title: 'Similar To This',
      iconAsset: AppAssets.vectorIcon,
      iconContainerColor: AppColors.textPrimary,
      iconColorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      iconSize: 12,
      gap: 12,
      titleFontSize: 14,
      titleWeight: 550,
      titleColor: AppColors.textDark,
    );
  }
}
