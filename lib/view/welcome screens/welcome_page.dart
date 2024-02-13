import 'package:ecommerce_app/authentication/auth.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .4,
                  ),
                  const Text(
                    'MAKE YOUR',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const Text('HOME BEAUTIFUL',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                  const Text(
                      'The best simple place where you discover most wonderful furnitures and make your home beautiful'),
                ],
              ),
              Positioned(
                bottom: 150,
                left: 100,
                right: 100,
                child: ButtonWidgets().rectangleButton(
                  size,
                  name: 'Get Started',
                  onPressed: () async {
                    NavigatorWidget()
                        .pushReplacement(context, const AuthenticationPage());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
