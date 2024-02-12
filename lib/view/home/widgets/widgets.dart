import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class HomeWidgets {
  Widget specialProduct(Size size, {required String imagePath}) {
    return Container(
      width: size.width * .7,
      height: size.width * .4,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        color: const Color.fromARGB(255, 30, 29, 29),
        borderRadius: BorderRadius.all(Radius.circular(size.width * .07)),
      ),
    );
  }

  Widget categoryItems(Size size, {required String imagePath}) {
    return Container(
      width: size.width * .2,
      height: size.width * .2,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        color: const Color.fromARGB(255, 30, 29, 29),
        borderRadius: BorderRadius.all(Radius.circular(size.width * .05)),
      ),
    );
  }

  Widget topBarIcon(Size size,
      {required IconData icon, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.width * .15,
          width: size.width * .15,
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: size.width * 0.06,
          ),
        ),
        SizedBox(
          width: size.width * .15,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }

  Widget buildProductItem(Size size, {products}) {
    return SingleChildScrollView(
      // Adding SingleChildScrollView here
      scrollDirection: Axis.vertical,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: size.height * 0.2,
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/dummy.jpg'))),
                    const SizedBox(height: 10),
                    TextWidgets().HeadingText(context, text: 'Product Name'),
                    TextWidgets().SubtitleText(context, text: 'SubTitle'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidgets().titleText2(context, text: '₹9999'),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 2,
                  bottom: 2,
                  child: IconsWidgets().IconButtonWidget(
                    context,
                    size,
                    iconData: Icons.favorite_border,
                    onPressed: () {},
                  ))
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
