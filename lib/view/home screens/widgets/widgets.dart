import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/pages/category_page.dart';
import 'package:ecommerce_app/view/product%20screen/product_details_page.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeWidgets {
  Widget specialProduct(Size size, {required String imagePath}) {
    return Container(
      width: size.width * .7,
      height: size.width * .4,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        color: const Color.fromARGB(255, 30, 29, 29),
        borderRadius: BorderRadius.all(Radius.circular(size.width * .03)),
      ),
    );
  }

  Widget categoryItems(context, Size size,
      {category, required String imagePath}) {
    return GestureDetector(
      onTap: () => NavigatorWidget().push(
          context,
          CategoryPage(
            category: category,
          )),
      child: Container(
        width: size.width * .2,
        height: size.width * .2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagePath), fit: BoxFit.cover),
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(size.width * .05)),
        ),
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

  Widget buildProductItem(Size size, {List<ProductModel>? products}) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: size.width * 0.05,
          crossAxisSpacing: size.width * 0.015,
          childAspectRatio: size.width / (size.width * 1.5),
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Stack(
            children: [
              GestureDetector(
                onTap: () =>
                    NavigatorWidget().push(context, ProductDetailsPage()),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: size.width * 0.42,
                          width: size.width * 0.42,
                          child: Image(
                              fit: BoxFit.contain,
                              image: product.image!.isNotEmpty
                                  ? NetworkImage(product.image.toString())
                                  : Lottie.asset(
                                          'assets/lottie/sellX logo.json')
                                      as ImageProvider)),
                      const SizedBox(height: 10),
                      SizedBox(
                          height: size.width * .1,
                          child: TextWidgets()
                              .titleText2(context, text: product.title!)),
                      TextWidgets().SubtitleText(context, text: product.brand!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidgets().titleText2(context,
                              text: "₹${product.price.toString()}"),
                        ],
                      )
                    ],
                  ),
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
        itemCount: products!.length,
      ),
    );
  }
}
