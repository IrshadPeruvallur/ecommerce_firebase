// ignore_for_file: must_be_immutable
import 'package:ecommerce_app/controller/authentication.dart';
import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/pages/wishlist_page.dart';
import 'package:ecommerce_app/view/product%20screen/my_product_tab.dart';
import 'package:ecommerce_app/view/profile%20screens/about_page.dart';
import 'package:ecommerce_app/view/profile%20screens/settings.dart';
import 'package:ecommerce_app/view/profile%20screens/user_detail_page.dart';
import 'package:ecommerce_app/view/welcome%20screens/welcome_page.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final List listTitles = [
    'my Profile',
    'my Products',
    'Wishlist',
    'Help Center',
  ];

  final List listSubTitles = [
    'Make Your Profile',
    'Active Ads & InActive Ads',
    'You have 2 cards',
    'FAQ, Contact, Privacy & Terms',
  ];

  final List<Widget> listTabs = [
    UserDetailsPage(),
    MyProductTab(),
    WishlistPage(),
    SettingsPage(),

    // const WishListTab(),
    // const CartPage(),
    // const SettingsPage(),
  ];

  String? username;

  String? email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                bool value = await PopupWidgets().showConfirmationDialog(
                    context,
                    label: 'Log out',
                    content:
                        'Are you sure you want to log out? Any unsaved work may be lost.',
                    title: 'Warning');
                if (value == true) {
                  logOut(context);
                }
              },
              icon: const Icon(
                EneftyIcons.logout_outline,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Column(
          children: [
            Consumer<UserProvider>(builder: (context, userProvide, child) {
              final currentUser = FirebaseAuth.instance.currentUser;
              final uId = currentUser?.uid;
              UserModel? userData = userProvide.getCurrentUserData(uId);
              return Row(
                children: [
                  CircleAvatar(
                    backgroundImage: userData!.profilePic != null
                        ? NetworkImage(userData.profilePic.toString())
                        : AssetImage('assets/icons/profile icons.png')
                            as ImageProvider,
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .45,
                        child: Text(
                          userData.name!.isEmpty
                              ? 'Uknown name'
                              : userData.name.toString(),
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .05,
                          ),
                        ),
                      ),
                      Text(
                        userData.phoneNumber ?? '',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .03,
                        ),
                      ),
                    ],
                  ),
                  // IconsWidgets().IconButtonWidget(context, size,
                  //     onPressed: () =>
                  //         NavigatorWidget().push(context, UserDetailsPage()),
                  //     iconData: EneftyIcons.edit_2_outline)
                ],
              );
            }),
            SizedBox(
              height: size.width * .1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Material(
                  elevation: 20,
                  shadowColor: const Color.fromARGB(48, 0, 0, 0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => listTabs[index],
                        )),
                    title: Text(
                      listTitles[index].toString().toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .04,
                      ),
                    ),
                    subtitle: Text(
                      listSubTitles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .03,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                        size: size.width * 0.055),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: size.width * .05,
                ),
                itemCount: listTabs.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logOut(context) async {
    final getProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    getProvider.googleSignOut();
    getProvider.signOutWithEmail();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Welcome(),
        ),
        (route) => false);

    await Provider.of<WidgetProviders>(
      context,
      listen: false,
    ).bottomBarFunction();
    PopupWidgets().showSuccessSnackbar(context, 'Log out Successfully');
  }
}
