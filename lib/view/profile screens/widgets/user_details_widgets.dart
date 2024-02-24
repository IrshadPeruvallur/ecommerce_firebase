import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidgets {
  Widget textFormFieldBox(
    bool clickBool,
    Size size,
    value,
    String label, {
    controller,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Material(
      elevation: 20,
      shadowColor: const Color.fromARGB(77, 0, 0, 0),
      child: clickBool == true
          ? ListTile(
              title: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: size.width * .03,
                ),
              ),
              subtitle: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: size.width * .04,
                ),
              ),
            )
          : TextFormField(
              inputFormatters: inputFormatter != null ? [inputFormatter] : [],
              keyboardType: keyboardType ?? TextInputType.text,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return " Please enter $label";
              //   } else {
              //     return null;
              //   }
              // },
              controller: controller,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                labelText: label,
                labelStyle: const TextStyle(color: Colors.black),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
    );
  }
}
