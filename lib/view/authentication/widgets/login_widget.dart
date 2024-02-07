import 'package:flutter/material.dart';

class LoginPageWidget {


  loginIcons(context) {
      Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
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
          onTap: () {},
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
