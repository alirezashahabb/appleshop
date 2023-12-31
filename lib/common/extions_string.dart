import 'dart:ui';

import 'package:intl/intl.dart';

/// this extension for Price set cama
extension PriceParing on int? {
  String formatPrice() {
    final formatter = NumberFormat('#,##0', 'en_US');

    return formatter.format(this);
  }
}

/// this extension convert  hexCode to Color
extension ColorParsing on String? {
  Color paresToColor() {
    String colorString = 'ff$this';
    int hexColor = int.parse(colorString, radix: 16);
    return Color(hexColor);
  }

  //this extension for bakLink Information from Zarinpal
  String? extractValueFromQuery(String key) {
    // Remove everything before the question mark
    int queryStartIndex = this!.indexOf('?');
    if (queryStartIndex == -1) return null;

    String query = this!.substring(queryStartIndex + 1);

    // Split the query into key-value pairs
    List<String> pairs = query.split('&');

    // Find the key-value pair that matches the given key
    for (String pair in pairs) {
      List<String> keyValue = pair.split('=');
      if (keyValue.length == 2) {
        String currentKey = keyValue[0];
        String value = keyValue[1];

        if (currentKey == key) {
          // Decode the URL-encoded value
          return Uri.decodeComponent(value);
        }
      }
    }

    return null;
  }
}
