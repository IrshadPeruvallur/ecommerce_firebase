import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final getProvider = Provider.of<UserProvider>(context, listen: false);

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
                SizedBox(
                  height: size.height * .02,
                ),
                Text(
                  "WELCOME",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: size.width * .07),
                ),
                SizedBox(
                  height: size.width * .1,
                ),
                Card(
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
                          label: 'Name',
                          // controller: getProvider.usernameController,
                        ),
                        TextFormField(
                          // inputFormatters:filt
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " Please enter email address";
                            } else if (!EmailValidator.validate(value)) {
                              return " Please enter a valid email address";
                            } else {
                              return null;
                            }
                          },
                          // controller: getProvider.emailController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        TextFieldWidgets().textFormField(
                          size,
                          label: 'Password',
                          // controller: getProvider.passwordController,
                        ),
                        SizedBox(
                          height: size.width * .18,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(size,
                            label: 'Sign Up', onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // // await createUser(context);
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .signUp(
                            //   getProvider.emailController.text.trim(),
                            //   getProvider.passwordController.text.trim(),
                            // );
                          }

                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => Home(),
                          // ));
                        }),
                        SizedBox(
                          height: size.width * .1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have account?'),
                            ButtonWidgets().textButtonWidget(size, context,
                                label: 'SIGN IN', onPressed: () {
                              Navigator.pop(context);
                            })
                          ],
                        )
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
}
