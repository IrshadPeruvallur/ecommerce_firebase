import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/profile%20screens/widgets/user_details_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetailsPage extends StatelessWidget {
  String uId;
  ContactDetailsPage({required this.uId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getuserProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    getuserProvider.getUserData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact  "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<UserProvider>(
          builder: (context, userProvide, child) {
            UserModel? userData = userProvide.getCurrentUserData(uId);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: userData!.profilePic != null
                        ? NetworkImage(userData.profilePic.toString())
                        : AssetImage('assets/icons/profile icons.png')
                            as ImageProvider,
                    radius: 70,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                Text(
                  "Personal Information",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * .035,
                  ),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                ProfileWidgets().textdBox(
                  size,
                  userData.name,
                  'Name',
                ),
                ProfileWidgets().textdBox(size, userData.phoneNumber, 'Phone'),
                ProfileWidgets().textdBox(size, userData.email, 'Email'),
                ProfileWidgets().textdBox(size, userData.address, 'Address'),
              ],
            );
          },
        ),
      ),
    );
  }
}
