// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Contact Us',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            'If you have any questions or suggestions, feel free to reach out to us through any of the following channels:',
          ),
          SizedBox(height: 20),
          Text(
            'Contact Information',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email: grafico706@gmail.com'),
            onTap: () {
              launchEmail('grafico706@gmail.com');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone: +91 9048 623 502'),
            onTap: () {
              launchPhone('+919048623502');
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Send a Message'),
            onTap: () {
              launchMessaging();
            },
          ),
        ],
      ),
    );
  }

  void launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      throw 'Could not launch $phoneLaunchUri';
    }
  }

  void launchMessaging() async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '+919048623502', // Phone number to send the message
      queryParameters: {
        'body': 'Hi, I have a question about your app.'
      }, // Message body
    );

    if (await canLaunch(smsLaunchUri.toString())) {
      await launch(smsLaunchUri.toString());
    } else {
      throw 'Could not launch $smsLaunchUri';
    }
  }
}
