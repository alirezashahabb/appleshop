import 'dart:ui';

/// this extension convert  hexCode to Color
extension ColorParsing on String? {
  Color paresToColor() {
    String colorString = 'ff$this';
    int hexColor = int.parse(colorString, radix: 16);
    return Color(hexColor);
  }
}
