import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<DatabaseProvider>(builder: (context, provider, _) {
              return Expanded(
                child: ListView.separated(
                  itemCount: provider.allProduct.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = provider.allProduct[index];
                    return Padding(
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
                                        image: AssetImage(
                                            'assets/images/dummy.jpg'),
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
                                  TextWidgets().titleText2(context,
                                      text: product.title.toString()),
                                  TextWidgets().SubtitleText(context,
                                      text: product.category.toString()),
                                  Row(
                                    children: [
                                      TextWidgets().titleText2(context,
                                          text: product.price.toString()),
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
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
