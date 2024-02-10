import 'package:ecommerce_app/controller/authentication.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TextFieldWidgets {
  Widget textFormField(
    Size size, {
    String? type,
    TextEditingController? controller,
    String? label,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Column(
      children: [
        Consumer<AuthenticationProvider>(builder: (context, prValue, child) {
          return TextFormField(
            inputFormatters: inputFormatter != null ? [inputFormatter] : [],
            keyboardType: keyboardType ?? TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter $label";
              } else if (type == "Email") {
                if (!EmailValidator.validate(value)) {
                  return "Please enter a valid email address";
                }
              } else if (type == 'Password') {
                if (value.length < 6) {
                  return 'Password should be at least 6 characters';
                }
              } else if (type == 'Confirm Password') {
                if (prValue.passwordController !=
                    prValue.confirmPasswordController) {
                  return 'Passwords do not match';
                }
              }
              return null;
            },
            obscureText:
                type == "Password" || type == "Confirm Password" ? true : false,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          );
        }),
        SizedBox(
          height: size.width * 0.05,
        )
      ],
    );
  }
}
