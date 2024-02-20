// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:ecommerce_app/controller/authentication.dart';
import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/pages/blank_page.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel? products;
  ProductDetailsPage({super.key, required this.products});
  String? user;
  @override
  Widget build(BuildContext context) {
    getUser();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBar(context,
          title: '',
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black),
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
                              image: NetworkImage(products!.image.toString()),
                              fit: BoxFit.contain),
                          color: Colors.transparent),
                      width: double.infinity,
                      height: size.height * .4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      products!.title ?? 'Lorem Ipsum',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .06),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          products!.price != null
                              ? "₹${products!.price.toString()}"
                              : '₹19999',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: size.width * .06),
                        ),
                        Consumer<DatabaseProvider>(
                          builder: (context, provider, child) {
                            bool isFavorite = provider.wishListCheck(products!);
                            return IconsWidgets().IconButtonWidget(
                              context,
                              size,
                              iconData: isFavorite
                                  ? EneftyIcons.heart_outline
                                  : EneftyIcons.heart_bold,
                              color: Colors.red,
                              onPressed: () async {
                                final value =
                                    await provider.wishListCheck(products!);
                                provider.IsWishLIstClick(products!.id, value);
                              },
                            );
                          },
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
                      products!.description ??
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
                  color: Colors.transparent,
                  child: ButtonWidgets().fullWidthElevatedButton(size,
                      onPressed: () {
                    if (products!.user != user) {
                      NavigatorWidget().push(
                          context,
                          BlankPage(
                            name: '',
                          ));
                    } else {
                      Provider.of<DatabaseProvider>(context, listen: false)
                          .isEdit = true;
                      NavigatorWidget().push(
                          context,
                          SellProductPage(
                            products: products,
                          ));
                    }
                  }, label: products!.user != user ? 'Buy Product' : 'Update'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getUser() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    user = currentUser.email ?? currentUser.phoneNumber;
  }
}
