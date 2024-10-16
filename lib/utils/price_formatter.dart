import 'package:intl/intl.dart';

String formatPrice(double price) {
  final formatter = NumberFormat.currency(
    locale: 'hu_HU',
    symbol: 'Ft',
    decimalDigits: 0,
    customPattern: '#,##0 ¤',
  );

  return formatter.format(price);
}
