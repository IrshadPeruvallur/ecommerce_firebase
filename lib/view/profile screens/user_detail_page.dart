import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/profile%20screens/widgets/user_details_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<WidgetProviders>(context, listen: false);
    final getuserProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    getuserProvider.getUserData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer2<WidgetProviders, UserProvider>(
          builder: (context, value, userProvide, child) {
            UserModel userData = getCurrentUserData(userProvide);
            return Column(
              children: [
                CircleAvatar(
                  backgroundImage: userData.userProfile != null
                      ? NetworkImage(userData.userProfile!)
                      : AssetImage('assets/icons/profile icons.png')
                          as ImageProvider,
                  radius: 70,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Personal Information",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .035,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        getProvider.userNameClicked();
                      },
                      icon: const Icon(EneftyIcons.edit_2_outline),
                      iconSize: size.width * .05,
                    )
                  ],
                ),
                ProfileWidgets().textFormFieldBox(
                  value.isUsernameEdit,
                  size,
                  userData.name ?? '',
                  'Name',
                ),
                ProfileWidgets().textFormFieldBox(
                  value.isUsernameEdit,
                  size,
                  userData.email ?? '',
                  'Email',
                ),
                ProfileWidgets().textFormFieldBox(
                  value.isUsernameEdit,
                  size,
                  userData.phoneNumber ?? '',
                  'Phone',
                ),
                ProfileWidgets().textFormFieldBox(
                  value.isUsernameEdit,
                  size,
                  userData.address ?? '',
                  'Address',
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  UserModel getCurrentUserData(UserProvider provider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final uId = currentUser!.uid;
    final userData =
        provider.allUserDatas.firstWhere((user) => user.uId == uId);
    return userData;
  }
}
