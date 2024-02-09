import 'package:ecommerce_app/controller/authentication.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageWidget {
  loginIcons(context) {
    Size size = MediaQuery.of(context).size;
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            try {
              await getProvider.googleSignIn();
              await PopupWidgets().showLoadingIndicator(context);
              NavigatorWidget().pushReplacement(context, HomeTab());
              PopupWidgets().showSuccessSnackbar(context, 'You are logged In');
            } catch (e) {
              return;
            }
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://freelogopng.com/images/all_img/1657955547black-google-icon.png',
                )),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        GestureDetector(
          onTap: () {
            getProvider.gitHubSignIn();
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                )),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/3e/f3/b2/3ef3b280bce4c1209e1e4376c7f452ed.jpg')),
          ),
        ),
      ],
    );
  }
}
