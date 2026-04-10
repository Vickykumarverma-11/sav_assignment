import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class StockPriceWidget extends StatelessWidget {
  const StockPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.primaryGradient.createShader(bounds),
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: Transform.translate(
                    offset: const Offset(0, -20),
                    child: Text(
                      '\$',
                      style: AppTextStyles.priceSymbol,
                    ),
                  ),
                ),
                TextSpan(
                  text: StockMockData.priceFormatted,
                  style: AppTextStyles.priceValue,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        const _DailyChangeBadge(),
      ],
    );
  }
}

class _DailyChangeBadge extends StatelessWidget {
  const _DailyChangeBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.5,
          colors: [
            AppColors.greenDeep.withValues(alpha: 0.40),
            AppColors.greenDeep.withValues(alpha: 0.06),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 119,
        height: 32,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.badgeBackground,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.priceUp,
                    width: 14,
                    height: 14,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '\$${StockMockData.dailyChange.toStringAsFixed(2)} today',
                style: AppTextStyles.dmSans(
                  weight: 450,
                  fontSize: 14,
                  color: AppColors.greenDeep,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
