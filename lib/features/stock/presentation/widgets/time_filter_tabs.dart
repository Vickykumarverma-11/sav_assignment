import 'package:flutter/material.dart';

import '../../../../core/constants/stock_mock_data.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class TimeFilterTabs extends StatefulWidget {
  const TimeFilterTabs({super.key});

  @override
  State<TimeFilterTabs> createState() => _TimeFilterTabsState();
}

class _TimeFilterTabsState extends State<TimeFilterTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        StockMockData.timeFilters.length,
        (i) => _TabChip(
          label: StockMockData.timeFilters[i],
          isSelected: _selectedIndex == i,
          onTap: () => setState(() => _selectedIndex = i),
        ),
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeInOut,
            height: 2,
            width: 24,
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.textPrimary : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            label,
            style: isSelected
                ? AppTextStyles.tabInactive.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  )
                : AppTextStyles.tabInactive,
          ),
        ],
      ),
    );
  }
}
