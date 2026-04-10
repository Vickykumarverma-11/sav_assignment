import 'package:flutter/material.dart';

import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../shared/widgets/faded_divider.dart';
import '../../../../shared/widgets/gradient_text.dart';
import '../../../../shared/widgets/layered_card_container.dart';

class SimilarStocksCard extends StatelessWidget {
  const SimilarStocksCard({super.key});

  @override
  Widget build(BuildContext context) {
    final stocks = StockMockData.similarStocks;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.cardHorizontal),
      child: LayeredCardContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Column(
          children: [
            for (int i = 0; i < stocks.length; i++) ...[
              _StockRowWidget(stock: stocks[i]),
              if (i < stocks.length - 1) const FadedDivider(),
            ],
          ],
        ),
      ),
    );
  }
}

class _StockRowWidget extends StatelessWidget {
  const _StockRowWidget({required this.stock});

  final SimilarStock stock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  stock.name,
                  style: AppTextStyles.dmSans(weight: 550, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  stock.meta,
                  style: AppTextStyles.dmSans(
                    weight: 400,
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  stock.price,
                  style: AppTextStyles.dmSans(weight: 550, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      stock.change,
                      style: AppTextStyles.dmSans(
                        weight: 400,
                        fontSize: 12,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GradientText(
                      stock.percent,
                      style: AppTextStyles.dmSans(weight: 400, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
