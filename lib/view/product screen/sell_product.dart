import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellProductPage extends StatelessWidget {
  SellProductPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  // Define a list of categories
  final List<String> categories = [
    'Mobile',
    'Laptop',
    'T-shirt',
    'Shirt',
    'Headphones',
    'Camera',
    'Shoes',
    'Watch',
    'Backpack',
    'Gaming Console'
  ];

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<ProductProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBarWithAction(context, size,
          title: 'Sell Product', iconbutton: EneftyIcons.bag_2_outline),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width * .5,
                      height: size.width * .5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              scale: size.width * .07,
                              image: AssetImage(
                                'assets/icons/upload image.png',
                              )),
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: size.width * .05,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.width * .04))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFieldWidgets().textFormField(size,
                            label: "Title",
                            controller: getProvider.titleController),
                        TextFieldWidgets().textFormField(size,
                            label: "Subtitle",
                            controller: getProvider.subtitleController),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 08),
                                child: DropdownButtonFormField<String>(
                                  value: selectedCategory,
                                  decoration: InputDecoration(
                                    labelText: 'Category',
                                  ),
                                  onChanged: (value) {
                                    selectedCategory = value;
                                  },
                                  items: categories.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select category';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.03),
                            Expanded(
                              child: TextFieldWidgets().textFormField(size,
                                  label: "Price",
                                  controller: getProvider.priceController),
                            ),
                          ],
                        ),
                        SizedBox(height: size.width * 0.05),
                        ButtonWidgets().fullWidthElevatedButton(
                          size,
                          label: 'Log in',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {}
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
