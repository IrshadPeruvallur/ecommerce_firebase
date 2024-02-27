import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/product%20screen/product_details_page.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({Key? key});

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
                                    NavigatorWidget().push(
                                        context,
                                        SellProductPage(
                                          products: product,
                                        ));
                                  },
                                  backgroundColor:
                                      Color.fromARGB(255, 192, 161, 37),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Edit',
                                )
                              ]),
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    // borderRadius: BorderRadius.circular(20),
                                    flex: 2,
                                    onPressed: (context) async {
                                      bool confirmDelete = await PopupWidgets()
                                          .showConfirmationDialog(context,
                                              title: 'Mark as sold',
                                              content:
                                                  '"Are you sure you want to enable  this product is sold?"',
                                              label: 'Sure');
                                      if (confirmDelete) {
                                        PopupWidgets()
                                            .showLoadingIndicator(context);
                                        await provider.idSold(product.id!);

                                        PopupWidgets().showSuccessSnackbar(
                                            context, 'Product marked as sold');
                                      }
                                    },
                                    backgroundColor: Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: EneftyIcons.bag_2_outline,
                                    label: 'Mark as Sold',
                                  ),
                                ],
                              ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              TextWidgets().titleText2(context,
                                                  text:
                                                      product.price.toString()),
                                            ],
                                          ),
                                          // Consumer<WidgetProviders>(
                                          //     builder: (context, value, child) {
                                          //   return AdvancedSwitch(
                                          //     inactiveChild: Text('Sold'),
                                          //     controller: value.isSwitched,
                                          //     activeColor: Colors.green,
                                          //     inactiveColor: Colors.red,

                                          //     width: size.width * .15,
                                          //   );
                                          // })
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
        .where((product) => product.userName == user && product.isSold == false)
        .toList();
    return myProducts;
  }
}
