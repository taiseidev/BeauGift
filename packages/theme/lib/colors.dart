import 'dart:ui';

class _HexColor extends Color {
  _HexColor(String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var localHexColor = hexColor;
    localHexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      localHexColor = 'FF$hexColor';
    }
    return int.parse(localHexColor, radix: 16);
  }
}

class AppColor {
  const AppColor._();
  static final primary = _HexColor('57E47A');
  static final secondary = _HexColor('393C44');
}
