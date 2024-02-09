import 'package:ecommerce_app/controller/authentication/email_password.dart';
import 'package:ecommerce_app/view/home/widgets/widgets.dart';
import 'package:ecommerce_app/view/welcome/welcome_screen.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<EmailPasswordAuthProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      getProvider.signOutWithEmail();
                      NavigatorWidget().pushRemoveUntil(context, Welcome());
                    },
                    icon: const Icon(EneftyIcons.search_normal_2_outline),
                  ),
                  SizedBox(width: size.width * .6, child: TextFormField()),
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(EneftyIcons.bag_2_outline),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomeWidgets().topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Popular'),
                    HomeWidgets().topBarIcon(size,
                        icon: EneftyIcons.path_outline, title: 'Bed'),
                    HomeWidgets().topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Sofa'),
                    HomeWidgets().topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Table'),
                    HomeWidgets().topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Chair'),
                    HomeWidgets().topBarIcon(size,
                        icon: EneftyIcons.star_outline, title: 'Bed'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: size.width * .05,
                    mainAxisSpacing: size.height * .06,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: HomeWidgets().prodectShow(
                        size,
                        context,
                        title: 'Dummy Product',
                        imagepath: const AssetImage('assets/images/dummy.jpg'),
                        prize: '₹19999',
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
