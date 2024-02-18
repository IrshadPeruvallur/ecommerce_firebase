// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatelessWidget {
  final title;
  final description;
  final price;
  final image;
  const ProductDetailsPage(
      {super.key, this.title, this.description, this.price, this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height * 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: image ??
                                  const AssetImage('assets/images/dummy.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Colors.amber),
                      width: double.infinity,
                      height: size.height * .5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromARGB(163, 255, 255, 255)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      title ?? 'Lorem Ipsum',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .06),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price != null ? price.toString() : '₹19999',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: size.width * .06),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  EneftyIcons.minus_square_outline,
                                  size: size.width * .06,
                                )),
                            Text(
                              "05",
                              style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                EneftyIcons.add_square_outline,
                                size: size.width * .06,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          EneftyIcons.star_bold,
                          color: Colors.amber,
                          size: size.width * .06,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontSize: size.width * .045,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(50 reviews)',
                          style: TextStyle(
                              fontSize: size.width * .035,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description ??
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
                      style: TextStyle(fontSize: size.width * .037),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * .07,
                        width: size.width * .2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.all(size.width * .07),
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 0, 0, 0)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 234, 234, 234)),
                          ),
                          onPressed: () {},
                          child: Icon(
                            EneftyIcons.heart_outline,
                            size: size.height * .04,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .07,
                        width: size.width * .6,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.all(size.width * .07),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              fontSize: size.width * .045,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
