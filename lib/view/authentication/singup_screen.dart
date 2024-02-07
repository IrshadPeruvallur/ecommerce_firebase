import 'package:ecommerce_app/controller/authentication/email_password.dart';
import 'package:ecommerce_app/controller/user/user_provider.dart';
import 'package:ecommerce_app/view/authentication/widgets/login_widget.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/home/widgets/widgets.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/snackbar_widget.dart';
import 'package:ecommerce_app/view/widgets/style_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.07,
                  ),
                ),
                SizedBox(height: size.width * 0.1),
                Card(
                  surfaceTintColor: Colors.white,
                  elevation: size.width * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.04),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Name',
                          controller: getProvider.usernameController,
                        ),
                        TextFieldWidgets().textFormField(
                          size,
                          controller: getProvider.emailController,
                          label: 'Email',
                        ),
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Password',
                          controller: getProvider.passwordController,
                        ),
                        SizedBox(height: size.width * 0.05),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Sign Up',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await checkLogin(context);
                            }
                          },
                        ),
                        StyleWidgets().lineDivider(text: 'or'),
                        LoginPageWidget().loginIcons(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            ButtonWidgets().textButtonWidget(
                              size,
                              context,
                              label: 'SIGN IN',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false)
        .createUserWithEmail();
    final getProvider =
        Provider.of<EmailPasswordAuthProvider>(context, listen: false);

    if (getProvider.user == null) {
      NavigatorWidget().push(context, HomeTab());
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Account created successfully!');
    } else {
      SnackBarWidget().showErrorSnackbar(
        context,
        'The email address is already in use by another account or an error occurred.',
      );
    }
  }
}
