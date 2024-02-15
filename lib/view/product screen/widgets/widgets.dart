import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductWidgets {
  showImagePickerBottomSheet(context, WidgetProviders value) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.camera,
                    size: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await value.pickImage(ImageSource.camera);
                      },
                      child: Text("Camera"))
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.photo,
                    size: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await value.pickImage(ImageSource.gallery);
                      },
                      child: Text("Gallery"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
