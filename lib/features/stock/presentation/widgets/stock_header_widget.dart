import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class StockIconWidget extends StatelessWidget {
  const StockIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.iconBorder, width: 1.5),
      ),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.iconBoxRadius),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(6),
          child: Image.asset(AppAssets.appleIcon, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class StockHeaderNameWidget extends StatelessWidget {
  const StockHeaderNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      StockMockData.companyName,
      style: AppTextStyles.companyName,
    );
  }
}
