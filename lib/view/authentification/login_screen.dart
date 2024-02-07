import 'package:ecommerce_app/view/authentification/singup_screen.dart';
import 'package:ecommerce_app/view/authentification/widgets/login_widget.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/style_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final getProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                Text(
                  "Hello!",
                  style: TextStyle(fontSize: size.width * .12),
                ),
                Text(
                  "WELCOME BACK",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: size.width * .07),
                ),
                SizedBox(
                  height: size.width * .1,
                ),
                Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: size.width * .05,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.width * .04))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Email',
                          // controller: getProvider.emailController
                        ),
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Password',
                          // controller: getProvider.passwordController
                        ),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Log in',
                          onPressed: () {
                            NavigatorWidget().push(context, HomeTab());
                            if (formKey.currentState!.validate()) {
                              // userLogin(context, getProvider);
                            }
                          },
                        ),
                        SizedBox(
                          height: size.width * .05,
                        ),
                        StyleWidgets().lineDivider('or'),
                        LoginPageWidget().loginIcons(context),
                        ButtonWidgets().textButtonWidget(size, context,
                            label: 'SIGN UP', onPressed: () {
                          NavigatorWidget().push(context, SignUpPage());
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // userLogin(context, UserProvider getProvider) {
  //   final getAuth = Provider.of<AuthProvider>(context, listen: false);
  //   getAuth.signIn(
  //     getProvider.emailController.text.trim(),
  //     getProvider.passwordController.text.trim(),
  //   );
  //   if (getAuth.user != null) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const Home(),
  //         ),
  //         (route) => false);
  //   }
  // }
}
