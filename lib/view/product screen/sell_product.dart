import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellProductPage extends StatelessWidget {
  SellProductPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
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
    final getProvider = Provider.of<DatabaseProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBarWithAction(context,
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
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
                            if (formKey.currentState!.validate()) {
                              addProduct(context);
                            }
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

  void addProduct(context) async {
    final getProvider = Provider.of<DatabaseProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    final product = ProductModel(
      id: user!.email ?? user.phoneNumber,
      title: getProvider.titleController.text,
      subtitile: getProvider.subtitleController.text,
      price: int.parse(getProvider.priceController.text),
      image: 'image',
      category: selectedCategory,
      timeStamp: DateTime.now(),
    );
    await getProvider.addProduct(product);
  }
}
