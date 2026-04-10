import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class AutoInvestCard extends StatelessWidget {
  const AutoInvestCard({super.key});

  static const double _dartOverflow = 30.0;
  static const double _cardHeight = 140.0;
  static const double _dartWidth = 120.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _dartOverflow),
          child: Container(
            height: _cardHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.autoInvestDark,
                  AppColors.autoInvestDark.withValues(alpha: 0.02),
                ],
              ),
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              boxShadow: [
                BoxShadow(
                  color: AppColors.autoInvestPrimary.withValues(alpha: 0.04),
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  center: Alignment(-1.2, -1.0),
                  radius: 2.0,
                  colors: [
                    AppColors.autoInvestPrimary,
                    AppColors.autoInvestMid,
                    AppColors.autoInvestLight,
                  ],
                  stops: [0.0, 0.45, 1.0],
                ),
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius - 1),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.xxxl,
                  AppSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      StockMockData.autoInvestTitle,
                      style: AppTextStyles.autoInvestTitle,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            StockMockData.autoInvestSubtitle,
                            style: AppTextStyles.dmSans(
                              weight: 450,
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.85),
                              height: 1.35,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.autoInvestPrimary,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: -25,
          right: 12,
          width: _dartWidth,
          height: _cardHeight + _dartOverflow,
          child: Image.asset(
            AppAssets.dartImage,
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
      ],
    );
  }
}
