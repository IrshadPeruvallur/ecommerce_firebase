import 'package:ecommerce_app/controller/authentication.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyOtpPage extends StatelessWidget {
  VerifyOtpPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * .2,
                ),
                Center(
                  child: SizedBox(
                      height: size.width * 0.6,
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/icons/get otp.png',
                        ),
                      )),
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
                        OtpTextField(
                          fieldWidth: size.width * .1,
                          numberOfFields: 6,
                          showFieldAsBox: true,
                          keyboardType: TextInputType.number,
                          onSubmit: (String verificationCode) async {
                            await getProvider.otpValue(verificationCode);
                         
                          },
                        ),
                       
                        SizedBox(
                          height: size.width * .1,
                        ),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Verfy',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await getProvider.verifyOTP(
                                  context, getProvider.otp);

                              ;
                            }
                          },
                        ),
                        ButtonWidgets().textButtonWidget(size, context,
                            label: 'Resend OTP', onPressed: () async {
                          await getProvider.getOTP(context,
                              '+91${getProvider.phoneController.text}');
                        })
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
