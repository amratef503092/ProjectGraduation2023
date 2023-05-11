import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color ,
    TextDecoration textDecoration
    ) {
  return GoogleFonts.inter(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    decoration: textDecoration
  );
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color , required double height ,
    TextDecoration textDecoration = TextDecoration.none
    }) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,textDecoration);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color ,required double height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,textDecoration);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color,required double height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,
  textDecoration
  );
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color,required double height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,
      textDecoration
  );
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color,required double height,    TextDecoration textDecoration = TextDecoration.none
    }) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
       textDecoration

  );
}
// extra bold
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, required Color color,required dynamic height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color,textDecoration);
}

  double toFigmaHeight({required double figmaHeight ,required double fontSize}) {
    return figmaHeight / fontSize;

}