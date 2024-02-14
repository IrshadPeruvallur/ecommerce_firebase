import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgets {
  Widget TitleText(BuildContext context, {required String text, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: color ?? Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget HeadingText(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.045,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget mainHeadingText(BuildContext context,
      {required String text, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          color: color ?? Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.055,
          fontWeight: FontWeight.bold,
        ),
        // style: TextStyle(
        //   color: color ?? Colors.black,
        //   fontSize: MediaQuery.of(context).size.width * 0.06,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
    );
  }

  Widget SubtitleText(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.035,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget BodyText(BuildContext context, {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.035,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget titleText2(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget ButtonLabel(BuildContext context,
      {required String text, Color? color}) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
