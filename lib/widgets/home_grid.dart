
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );}
  
Widget textAbel({data, size, weight}) {
  return Text(data,
      style: GoogleFonts.abel(
          fontWeight: weight,
          fontSize: size,
          color: Colors.yellow,
          letterSpacing: 5));
}
