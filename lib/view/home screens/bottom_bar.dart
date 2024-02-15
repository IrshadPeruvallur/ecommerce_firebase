import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/view/authentication%20screens/verify_otp_screen.dart';
import 'package:ecommerce_app/view/authentication%20screens/login_screen.dart';
import 'package:ecommerce_app/view/home%20screens/home_tab.dart';
import 'package:ecommerce_app/view/product%20screen/sell_product.dart';
import 'package:ecommerce_app/view/profile%20screens/profile_tab.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  final List<SalomonBottomBarItem> bottomItems = [
    SalomonBottomBarItem(
        icon: Icon(EneftyIcons.home_outline), title: Text('Home')),
    SalomonBottomBarItem(
        icon: Icon(EneftyIcons.add_outline), title: Text('Sell')),
    SalomonBottomBarItem(
        icon: Icon(EneftyIcons.profile_outline), title: Text('Profile')),
  ];

  final List<Widget> tabsList = [
    HomeTab(),
    SellProductPage(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetProviders>(
      builder: (context, value, child) {
        return Scaffold(
          body: tabsList[value.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SalomonBottomBar(
              onTap: (index) => value.indexChanging(index),
              currentIndex: value.currentIndex,
              items: bottomItems,
            ),
          ),
        );
      },
    );
  }
}