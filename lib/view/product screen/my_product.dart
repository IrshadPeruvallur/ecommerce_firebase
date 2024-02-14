import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class MyProductPage extends StatelessWidget {
  const MyProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBar(
        title: 'My Products',
        context,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 15,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  height: size.width * .25,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.width * .2,
                              width: size.width * .2,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/dummy.jpg'),
                                      fit: BoxFit.cover),
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidgets()
                                    .titleText2(context, text: 'Product Name'),
                                TextWidgets().SubtitleText(context,
                                    text: 'catogery Name'),
                                Row(
                                  children: [
                                    TextWidgets()
                                        .titleText2(context, text: '₹1999'),
                                    SizedBox(
                                      width: size.width * .04,
                                    ),
                                    TextWidgets().SubtitleText(context,
                                        text: '/Sold', color: Colors.green),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(EneftyIcons.close_circle_outline,
                                size: size.width * 0.07))
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
