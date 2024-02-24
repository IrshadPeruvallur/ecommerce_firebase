// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ContactDetailsPage extends StatelessWidget {
  ContactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final getProvider = Provider.of<DBProfile>(
    //   context,
    // );

    // getProvider.getAllUser();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              // final data = getProvider.profileList[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: screenSize.width * 0.15,
                    backgroundColor: Colors.white,
                    backgroundImage: /* data.image != null
                              ? FileImage(File(data.image))
                              : */
                        const AssetImage('assets/icons/profile icons.png'),
                  ),
                  TextWidgets().BodyTextBold(context, text: 'Username'),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.04))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          doubleText(context,
                              text1: 'Phone', text2: '+91 9876 543 210'),
                          doubleText(context,
                              text1: 'Email', text2: 'user@gmail.com'),
                          TextWidgets().BodyTextBold(context, text: 'Address'),
                          TextWidgets().BodyText(context,
                              text:
                                  'Address........................................................'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  doubleText(context, {text1, text2}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidgets().BodyTextBold(context, text: text1),
          TextWidgets().BodyText(context, text: text2),
        ],
      ),
    );
  }
}
