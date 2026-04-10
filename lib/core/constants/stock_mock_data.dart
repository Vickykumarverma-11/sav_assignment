abstract final class StockMockData {
  static const String ticker = 'AAPL';
  static const String companyName = 'Apple Inc.';
  static const String marketStatus = 'Markets Open';

  static const double price = 195.31;
  static const String priceFormatted = '195.31';
  static const double dailyChange = 2.34;
  static const double changePercent = 1.21;

  static const String marketCap = '\$3.1T';
  static const String peRatio = '26.4';
  static const String divYield = '0.52%';
  static const String annualReturn = '9.20';
  static const String avgVolume = '62.06M';

  static const String autoInvestTitle = 'Auto-Invest on\nyour schedule';
  static const String autoInvestSubtitle =
      'Investing consistently helps\naverage out costs over time.';

  static const List<double> priceHistory = [
    187.5,
    184.2,
    188.9,
    183.0,
    185.7,
    189.3,
    186.8,
    192.1,
    185.4,
    183.6,
    187.2,
    191.8,
    188.5,
    194.7,
    192.0,
    196.3,
    193.9,
    195.5,
    194.2,
    195.31,
  ];

  static const int graphDotIndex = 9;

  static const List<double> returnsDistribution = [
    0.30,
    0.55,
    0.35,
    0.65,
    0.40,
    0.75,
    0.45,
    0.35,
    0.50,
    0.60,
    0.85,
    0.40,
    1.00,
    0.55,
    0.70,
    0.90,
    0.50,
    0.80,
    0.65,
    0.72,
  ];

  static const List<String> timeFilters = ['1D', '1M', '1Y', '3Y', '5Y', 'All'];

  static const List<SimilarStock> similarStocks = [
    SimilarStock(
      name: 'Apple Inc.',
      price: '\$195.31',
      meta: 'Mkt. Cap \$3.1T',
      change: '+\$2.34',
      percent: '0.17%',
    ),
    SimilarStock(
      name: 'Apple Inc.',
      price: '\$195.31',
      meta: 'Mkt. Cap \$3.1T',
      change: '+\$2.34',
      percent: '0.17%',
    ),
    SimilarStock(
      name: 'Apple Inc.',
      price: '\$195.31',
      meta: 'Mkt. Cap \$3.1T',
      change: '+\$2.34',
      percent: '0.17%',
    ),
    SimilarStock(
      name: 'Apple Inc.',
      price: '\$195.31',
      meta: 'Mkt. Cap \$3.1T',
      change: '+\$2.34',
      percent: '0.17%',
    ),
  ];
}

class SimilarStock {
  const SimilarStock({
    required this.name,
    required this.price,
    required this.meta,
    required this.change,
    required this.percent,
  });

  final String name;
  final String price;
  final String meta;
  final String change;
  final String percent;
}
