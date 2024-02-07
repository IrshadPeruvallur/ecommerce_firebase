import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidgets {
  Widget textFormField(
    Size size, {
    TextEditingController? controller,
    String? label,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Column(
      children: [
        TextFormField(
          inputFormatters: inputFormatter != null ? [inputFormatter] : [],
          keyboardType: keyboardType ?? TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter $label";
            } else if (label == "Email") {
              if (!EmailValidator.validate(value)) {
                return "Please enter a valid email address";
              }
            } else if (label == 'Password') {
              if (value.length <= 6) {
                return 'Password should be at least 6 characters';
              }
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: size.width * 0.05,
        )
      ],
    );
  }
}
