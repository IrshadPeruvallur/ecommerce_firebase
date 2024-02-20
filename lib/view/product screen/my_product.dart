import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyProductPage extends StatelessWidget {
  const MyProductPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidgets().appBar(
        title: 'My Products',
        context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DatabaseProvider>(
              builder: (context, provider, _) {
                final List<ProductModel> myProducts =
                    filteringMyProduct(provider);
                return myProducts.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: myProducts.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            final product = myProducts[index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: size.width * .2,
                                        width: size.width * .2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    product.image.toString()),
                                                fit: BoxFit.cover),
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgets().titleText2(context,
                                              text: product.title.toString()),
                                          TextWidgets().SubtitleText(context,
                                              text:
                                                  product.category.toString()),
                                          Row(
                                            children: [
                                              TextWidgets().titleText2(context,
                                                  text:
                                                      product.price.toString()),
                                              SizedBox(
                                                width: size.width * .04,
                                              ),
                                              TextWidgets().SubtitleText(
                                                  context,
                                                  text: '/Sold',
                                                  color: Colors.green),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconsWidgets().IconButtonWidget(
                                    context,
                                    size,
                                    onPressed: () async {
                                      PopupWidgets().showWarningDialog(
                                        context,
                                        label: 'Delete',
                                        onPressed: () async {
                                          PopupWidgets()
                                              .showLoadingIndicator(context);
                                          await provider
                                              .deleteMyProduct(product.id);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          PopupWidgets().showSuccessSnackbar(
                                              context,
                                              'Item Deleted successfully');
                                        },
                                        title: 'Delete',
                                        text:
                                            'Are you sure you want to delete this item?',
                                      );
                                    },
                                    iconData: EneftyIcons.close_circle_outline,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Lottie.asset(
                            width: size.width * .20,
                            height: size.width * .20,
                            'assets/lottie/sellX logo.json'),
                      );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 37, 157, 192),
          onPressed: () {
            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) => SellProductPage(),
            // );
            NavigatorWidget().push(context, SellProductPage());
          },
          child: IconsWidgets().IconButtonWidget(context, size,
              color: Colors.white, iconData: EneftyIcons.add_outline)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  filteringMyProduct(DatabaseProvider provider) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    final user = currentUser.email ?? currentUser.phoneNumber;

    List<ProductModel> myProducts =
        provider.allProduct.where((product) => product.user == user).toList();
    return myProducts;
  }
}
