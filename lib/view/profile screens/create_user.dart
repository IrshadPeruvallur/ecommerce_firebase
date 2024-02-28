import 'dart:io';

import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/product%20screen/widgets/widgets.dart';
import 'package:ecommerce_app/view/widgets/appbar_widget.dart';
import 'package:ecommerce_app/view/widgets/button_widgets.dart';
import 'package:ecommerce_app/view/widgets/popup_widget.dart';
import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateUserDetails extends StatelessWidget {
  CreateUserDetails({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final widgetProvider = Provider.of<WidgetProviders>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidgets().appBar(context, title: 'title'),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await ProductWidgets()
                        .showImagePickerBottomSheet(context, widgetProvider);
                  },
                  child: Consumer<WidgetProviders>(
                      builder: (context, value, child) {
                    return CircleAvatar(
                      radius: 70,
                      backgroundImage: value.file == null
                          ? AssetImage(
                              'assets/icons/profile icons.png',
                            )
                          : FileImage(
                              File(value.file!.path),
                            ) as ImageProvider,
                    );
                  }),
                ),
                TextFieldWidgets().textFormField(size,
                    inputFormatter:
                        FilteringTextInputFormatter.singleLineFormatter,
                    label: 'Name',
                    controller: userProvider.nameController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    controller: userProvider.emailController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    prefixText: '+91',
                    maxLine: 10,
                    controller: userProvider.phoneNumberController),
                TextFieldWidgets().textFormField(size,
                    keyboardType: TextInputType.streetAddress,
                    label: 'Address',
                    controller: userProvider.addressController),
                SizedBox(
                  height: 10,
                ),
                ButtonWidgets().fullWidthElevatedButton(
                  size,
                  label: 'Submit',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (widgetProvider.file != null) {
                        bool value = await PopupWidgets().showConfirmationDialog(
                            context,
                            title: "Warning",
                            content:
                                """Create your profile once; you can't edit or delete your account. Please verify all data for accuracy.""",
                            label: 'Set Profile');

                        if (value) {
                          PopupWidgets().showLoadingIndicator(context);
                          await addProduct(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      } else {
                        PopupWidgets().showErrorSnackbar(
                            context, 'Please Select a image');
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addProduct(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final getwidgetProvider =
        Provider.of<WidgetProviders>(context, listen: false);
    PopupWidgets().showLoadingIndicator(context);
    await getProvider.uploadImage(File(getwidgetProvider.file!.path));

    final user = FirebaseAuth.instance.currentUser;
    final product = UserModel(
        email: getProvider.emailController.text,
        name: getProvider.nameController.text,
        uId: user!.uid,
        address: getProvider.addressController.text,
        phoneNumber: getProvider.phoneNumberController.text,
        profilePic: getProvider.downloadURL);
    getProvider.addProduct(product);
    getwidgetProvider.file = null;
    Navigator.pop(context);
    PopupWidgets().showSuccessSnackbar(context, 'Profile has been created');
  }
}
