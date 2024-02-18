import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/product%20screen/product_details_page.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<DatabaseProvider>(builder: (context, provider, child) {
            final List<ProductModel> myProducts = filteringMyProduct(provider);
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
                                onPressed: (context) async {
                                  await provider.IsWishLIstClick(
                                      product.id, false);
                                },
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              )
                            ]),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (context) {},
                                  backgroundColor: Color(0xFF7BC043),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Archive',
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.save,
                                  label: 'Save',
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () => NavigatorWidget().push(
                                    context,
                                    ProductDetailsPage(
                                      products: product,
                                    )),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text: product.category.toString()),
                                        TextWidgets().titleText2(context,
                                            text:
                                                "₹${product.price.toString()}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  )
                : Center(
                    child: Lottie.asset(
                        width: size.width * .20,
                        height: size.width * .20,
                        'assets/lottie/sellX logo.json'),
                  );
          }),
        ],
      ),
    );
  }

  filteringMyProduct(DatabaseProvider provider) {
    final item = provider.allProduct.where((product) {
      return product.wishList == true;
    }).toList();

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return null;
    }
    final user = currentUser.email ?? currentUser.phoneNumber;

    List<ProductModel> myProducts =
        item.where((product) => product.user == user).toList();

    return myProducts;
  }
}
