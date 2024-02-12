import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:ecommerce_app/view/home/widgets/widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
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
            icon: const Icon(EneftyIcons.search_normal_2_outline),
            onPressed: () {},
          ),
        ],
        // backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .01,
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
              SizedBox(
                height: size.height * .03,
              ),
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
              SizedBox(
                height: size.height * .03,
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
