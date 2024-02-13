import 'package:ecommerce_app/controller/authentication.dart';
import 'package:ecommerce_app/view/pages/cart_page.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:ecommerce_app/view/home%20screens/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final List<String> specialProduct = [
    'assets/images/offer 1.jpg',
    'assets/images/offer 2.jpg',
    'assets/images/offer 3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final getAuthPrv =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.width * .2,
        leading: Container(
          width: 40,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image(
              color: Colors.white,
              image: AssetImage(
                'assets/icons/sellx logo.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: SizedBox(
          width: size.width * .6,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(EneftyIcons.bag_2_outline),
            onPressed: () {
              NavigatorWidget().push(context, CartPage());
            },
          ),
        ],
        // backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgets().mainHeadingText(context, text: 'Category  '),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: HomeWidgets().categoryItems(
                        size,
                        imagePath: 'assets/images/headset .jpg',
                      ),
                    ),
                  ),
                ),
              ),
              TextWidgets().mainHeadingText(context, text: 'Sponsered  '),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    specialProduct.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: HomeWidgets().specialProduct(
                        size,
                        imagePath: specialProduct[index],
                      ),
                    ),
                  ),
                ),
              ),
              TextWidgets().mainHeadingText(context, text: 'Products  '),
              HomeWidgets().buildProductItem(
                size,
              )
            ],
          ),
        ),
      ),
    );
  }
}
