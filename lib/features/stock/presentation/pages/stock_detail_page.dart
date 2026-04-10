import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../components/auto_invest_card.dart';
import '../components/insights_card.dart';
import '../components/invest_bar.dart';
import '../components/similar_stocks_card.dart';
import '../components/similar_to_this_section.dart';
import '../components/stock_card.dart';

class StockDetailPage extends StatelessWidget {
  const StockDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const _PageHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: AppSpacing.lg,
                  bottom: AppSpacing.lg,
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenHorizontal,
                      ),
                      child: StockCard(),
                    ),
                    SizedBox(height: AppSpacing.xxxxl),
                    InsightsSection(),
                    SizedBox(height: AppSpacing.xxxxl),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenHorizontal,
                      ),
                      child: AutoInvestCard(),
                    ),
                    SizedBox(height: AppSpacing.xxxxl),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenHorizontalLarge,
                      ),
                      child: SimilarToThisHeader(),
                    ),
                    SizedBox(height: AppSpacing.md),
                    SimilarStocksCard(),
                    SizedBox(height: AppSpacing.xxxxl),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenHorizontal,
                      ),
                      child: InvestBar(),
                    ),
                    SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SvgIconButton(assetPath: AppAssets.arrowBack, onTap: () {}),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(StockMockData.marketStatus, style: AppTextStyles.pageTitleDMSans),
              const _SunIcon(),
            ],
          ),
          _SvgIconButton(assetPath: AppAssets.bookmark, onTap: () {}),
        ],
      ),
    );
  }
}

class _SunIcon extends StatelessWidget {
  const _SunIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.arcSun,
      width: 134,
      height: 23,
      fit: BoxFit.contain,
    );
  }
}

class _SvgIconButton extends StatelessWidget {
  const _SvgIconButton({required this.assetPath, required this.onTap});

  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.cardSurface,
          borderRadius: BorderRadius.circular(AppSpacing.iconBoxRadius),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0E000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            assetPath,
            colorFilter: const ColorFilter.mode(
              AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
