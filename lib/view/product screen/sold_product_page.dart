import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/product%20screen/product_details_page.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SoldProductPage extends StatelessWidget {
  const SoldProductPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBarWidgets().appBar(
      //   title: 'My Products',
      //   context,
      // ),
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
                            return Slidable(
                              startActionPane:
                                  ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  // borderRadius: BorderRadius.circular(20),
                                  onPressed: (context) async {
                                    bool confirmDelete = await PopupWidgets()
                                        .showConfirmationDialog(context,
                                            title: 'Delete Product',
                                            content:
                                                '"Are you sure you want to delete this product?"',
                                            label: 'Delete');
                                    if (confirmDelete) {
                                      PopupWidgets()
                                          .showLoadingIndicator(context);
                                      await provider
                                          .deleteMyProduct(product.id);

                                      PopupWidgets().showSuccessSnackbar(
                                          context, 'Item Deleted successfully');
                                    }
                                  },
                                  backgroundColor:
                                      Color.fromARGB(255, 162, 2, 2),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                              ]),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () => NavigatorWidget().push(context,
                                      ProductDetailsPage(products: product)),
                                  child: Row(
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
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidgets().titleText2(context,
                                                  text:
                                                      product.title.toString()),
                                              TextWidgets().SubtitleText(
                                                  context,
                                                  text: product.category
                                                      .toString()),
                                              Row(
                                                children: [
                                                  TextWidgets().titleText2(
                                                      context,
                                                      text: product.price
                                                          .toString()),
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
                                    ],
                                  ),
                                ),
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
    );
  }

  filteringMyProduct(DatabaseProvider provider) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    final user = currentUser.email ?? currentUser.phoneNumber;

    List<ProductModel> myProducts = provider.allProduct
        .where((product) => product.userName == user && product.isSold == true)
        .toList();
    return myProducts;
  }
}
