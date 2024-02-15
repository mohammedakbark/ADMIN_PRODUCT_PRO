import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle interStyle(FontWeight fontWeight,Color color,double size,) {
  return GoogleFonts.inter(fontWeight: fontWeight,fontSize: size,color: color );
}

TextStyle poppinsStyle(FontWeight fontWeight,Color color,double size,) {
  return GoogleFonts.poppins(fontWeight: fontWeight,fontSize: size,color: color );
}
