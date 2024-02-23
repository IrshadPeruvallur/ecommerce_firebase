import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/product%20screen/upcoming_product.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/product%20screen/sold_product_page.dart';
import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:enefty_icons/enefty_icons.dart';
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
          // automaticallyImplyLeading: false,
          title: Text('My Products'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Upcoming',
              ),
              Tab(
                text: 'Sold',
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
            onPressed: () {
              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) => SellProductPage(),
              // );

              Provider.of<DatabaseProvider>(context, listen: false).isEdit =
                  false;
              NavigatorWidget().push(
                  context,
                  SellProductPage(
                    products: ProductModel(),
                  ));
            },
            child: IconsWidgets().IconButtonWidget(
                context, MediaQuery.of(context).size,
                color: Colors.white, iconData: EneftyIcons.add_outline)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
