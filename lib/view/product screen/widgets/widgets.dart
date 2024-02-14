import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidgets {
  Widget dropdDownButton() {
    return Consumer<WidgetProviders>(builder: (context, widgetvalue, child) {
      return Expanded(
        child: DropdownButtonFormField<String>(
          value: widgetvalue.selectedItem,
          decoration: InputDecoration(
            labelText: 'Category',
          ),
          onChanged: (value) {
            // Update the selected category
            widgetvalue.selectedItem = value;
          },
          items: widgetvalue.items.map((category) {
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
      );
    });
  }
}
