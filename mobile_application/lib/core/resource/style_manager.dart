import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color ,double height,
    TextDecoration textDecoration
    ) {
  return GoogleFonts.inter(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    height: height,
    decoration: textDecoration
  );
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color , required double height ,
    TextDecoration textDecoration = TextDecoration.none
    }) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,height,textDecoration);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color ,required double height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,height,textDecoration);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color,required double height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,height,
  textDecoration
  );
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color,required double height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,height,
      textDecoration
  );
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color,required double height,    TextDecoration textDecoration = TextDecoration.none
    }) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,height,
       textDecoration

  );
}
// extra bold
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, required Color color,required dynamic height,
      TextDecoration textDecoration = TextDecoration.none

    }) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color,height,textDecoration);
}

  double toFigmaHeight({required double figmaHeight ,required double fontSize}) {
    return figmaHeight / fontSize;

}