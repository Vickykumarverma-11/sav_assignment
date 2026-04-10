import 'package:flutter/material.dart';
import 'package:sav_assignment/core/constants/app_assets.dart';

import '../../../../core/constants/stock_mock_data.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../shared/widgets/gradient_border_container.dart';
import '../../../../shared/widgets/gradient_text.dart';

class InvestBar extends StatelessWidget {
  const InvestBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GradientBorderContainer(
        borderRadius: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.iconBorder,
                    width: 1.5,
                  ),
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
              const SizedBox(width: AppSpacing.md),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${StockMockData.price}',
                    style: AppTextStyles.dmSans(
                      weight: 600,
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '+${StockMockData.changePercent}% today',
                    style: AppTextStyles.dmSans(
                      weight: 450,
                      fontSize: 14,
                      color: AppColors.primaryMedium,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              GradientBorderContainer(
                borderRadius: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm + 2,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.buttonSurfaceTop, AppColors.buttonSurfaceBottom],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: GradientText(
                    'Invest',
                    style: AppTextStyles.dmSans(
                      weight: 600,
                      fontSize: 14,
                      letterSpacing: -0.28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
