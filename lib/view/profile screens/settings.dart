import 'package:ecommerce_app/view/pages/blank_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final List listTitles = [
    'FAQ',
    'Contact Us',
    'Privacy & Terms',
  ];
  final List<Widget> listTabs = [
    const BlankPage(name: 'FAQ'),
    const BlankPage(name: 'Contact Us'),
    const BlankPage(name: 'Privacy & Terms'),
  ];
  @override
  Widget build(BuildContext context) {
    // final getProvider = Provider.of<WidgetProviders>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width * .1,
                width: double.infinity,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Material(
                  elevation: 20,
                  shadowColor: const Color.fromARGB(48, 0, 0, 0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => listTabs[index],
                      ),
                    ),
                    title: Text(
                      listTitles[index].toString().toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * .035,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                        size: size.width * 0.045),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: size.width * .05,
                ),
                itemCount: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
