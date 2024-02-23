import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image(
                  width: 50,
                  image: AssetImage('assets/icons/sellx logo.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextWidgets().titleText2(context,
                  text: 'SellX: Your Ultimate Buying and Selling Platform'),
              TextWidgets().BodyText(context,
                  text:
                      'SellX is a cutting-edge mobile application designed to revolutionize the way users buy and sell products online. With its intuitive interface and robust features, SellX offers a seamless experience for both buyers and sellers, empowering individuals to connect, transact, and discover a wide range of products with ease.'),
              SizedBox(height: 20),
              TextWidgets().titleText2(context, text: 'Key Features'),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgets().BodyText(context,
                        text:
                            'User-Friendly Interface: SellX boasts a user-friendly interface that simplifies the buying and selling process, making it accessible to users of all experience levels.'),
                    SizedBox(height: 10),
                    TextWidgets().BodyText(context,
                        text:
                            'Secure Authentication: Our platform ensures secure user authentication, safeguarding user accounts and information.'),
                    SizedBox(height: 10),
                    TextWidgets().BodyText(context,
                        text:
                            'Product Listings: Sellers can effortlessly list their products on SellX, providing detailed descriptions, images, and pricing information.'),
                    // Add more key features as needed
                    SizedBox(height: 20),
                  ],
                ),
              ),
              TextWidgets().titleText2(context, text: 'About'),
              SizedBox(
                width: double.infinity,
                child: TextWidgets().BodyText(context,
                    text:
                        'SellX is committed to providing a seamless and secure platform for users to buy and sell products online. With a focus on user experience and reliability, SellX aims to revolutionize the e-commerce landscape and empower individuals to transact with confidence.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
