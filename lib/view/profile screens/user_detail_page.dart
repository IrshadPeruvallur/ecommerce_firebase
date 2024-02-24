// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/view/profile%20screens/widgets/user_details_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<WidgetProviders>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<WidgetProviders>(
          builder: (context, value, child) {
            // Retrieve data from Firebase provider
            // Replace these placeholders with actual data retrieval code
            String username = ""; // Replace with actual username retrieval
            // Other user details similarly

            return Column(
              children: [
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
                  username, // Use retrieved username here
                  'Username',
                ),
                // Similarly, populate other user details here
                SizedBox(
                  height: size.width * .05,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
