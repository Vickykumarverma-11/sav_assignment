import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/stock/presentation/pages/stock_detail_page.dart';

void main() {
  runApp(const StockApp());
}

class StockApp extends StatelessWidget {
  const StockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const StockDetailPage(),
    );
  }
}
