import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/product%20screen/sold_product_page.dart';
import 'package:ecommerce_app/view/product%20screen/upcoming_product.dart';
import 'package:ecommerce_app/view/profile%20screens/create_user.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTab extends StatefulWidget {
  const MyProductTab({Key? key}) : super(key: key);

  @override
  State<MyProductTab> createState() => _MyProductTabState();
}

class _MyProductTabState extends State<MyProductTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Products'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Active Ads',
              ),
              Tab(
                text: 'Inactive Ads',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpComingPage(),
            SoldProductPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 37, 157, 192),
          onPressed: () async {
            final currentUser = FirebaseAuth.instance.currentUser;
            final uId = currentUser?.uid;

            if (uId != null) {
              UserModel? userData =
                  await Provider.of<UserProvider>(context, listen: false)
                      .getCurrentUserData(uId);

              if (userData == null || userData.name!.isEmpty) {
                bool value = await PopupWidgets().showConfirmationDialog(
                    context,
                    content:
                        'You have no account. If you want to sell any product, please create your profile.',
                    label: 'Go To Profile Tab');

                if (value) {
                  NavigatorWidget().push(context, CreateUserDetails());
                }
              } else {
                Provider.of<DatabaseProvider>(context, listen: false).isEdit =
                    false;
                NavigatorWidget().push(
                  context,
                  SellProductPage(
                    products: ProductModel(),
                  ),
                );
              }
            }
          },
          child: IconsWidgets().IconButtonWidget(
            context,
            MediaQuery.of(context).size,
            color: Colors.white,
            iconData: EneftyIcons.add_outline,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
