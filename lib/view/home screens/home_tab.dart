import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/view/pages/wishlist_page.dart';
import 'package:ecommerce_app/view/widgets/navigator.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:ecommerce_app/view/home%20screens/widgets/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    Provider.of<DatabaseProvider>(context, listen: false).getAllProducts();
  }

  final List<String> specialProduct = [
    'assets/images/offer 1.jpg',
    'assets/images/offer 2.jpg',
    'assets/images/offer 3.jpg'
  ];

  final List<String> catorgoryName = [
    'Mobile',
    'Laptop',
    'Smartwatch',
    'Headphones',
    'Camera',
    'Mouse and Keyboard',
    'Speaker',
  ];
  final List<String> catorgoryItems = [
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Tablets._CB574550011_.png',
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Gaming-laptops._CB574550011_.png',
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Wearables._CB574550011_.png',
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Headphones._CB574550011_.png',
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Cameras._CB574550011_.png',
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Computer-Accessories._CB574550011_.png',
    'https://m.media-amazon.com/images/G/31/img23/CEPC/BAU/ELP/navtiles/Soundbars._CB574550011_.png'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final getAuthPrv = Provider.of<DatabaseProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.width * .2,
        leading: Container(
          width: 40,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image(
              color: Colors.white,
              image: AssetImage(
                'assets/icons/sellx logo.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: SizedBox(
          width: size.width * .6,
          child: TextFormField(
            onChanged: (value) {
              getAuthPrv.searchFilter(value);
            },
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(EneftyIcons.heart_outline),
            onPressed: () {
              NavigatorWidget().push(context, WishlistPage());
            },
          ),
        ],
        // backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets().mainHeadingText(context, text: 'Category  '),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      catorgoryItems.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          right: 8,
                        ),
                        child: HomeWidgets().categoryItems(context, size,
                            category: catorgoryName[index],
                            imagePath: catorgoryItems[index]),
                      ),
                    ),
                  ),
                ),
                // TextWidgets().mainHeadingText(context, text: 'Sponsered  '),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: List.generate(
                //       specialProduct.length,
                //       (index) => Padding(
                //         padding: EdgeInsets.only(
                //           right: 8,
                //         ),
                //         child: HomeWidgets().specialProduct(
                //           size,
                //           imagePath: specialProduct[index],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                TextWidgets().mainHeadingText(context, text: 'Products  '),
                Consumer<DatabaseProvider>(builder: (context, provider, child) {
                  return provider.allProduct.isNotEmpty
                      ? HomeWidgets().buildProductItem(
                          size,
                          provider,
                          products: provider.searchedList.isEmpty
                              ? provider.allProduct
                              : provider.searchedList,
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: size.width * .2,
                            ),
                            Center(
                              child: Lottie.asset(
                                  width: size.width * .20,
                                  height: size.width * .20,
                                  'assets/lottie/sellX logo.json'),
                            ),
                          ],
                        );
                })
              ],
            ),
          )),
    );
  }
}
