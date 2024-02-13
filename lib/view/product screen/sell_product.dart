import 'package:ecommerce_app/view/widgets/text_fields_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SellProductPage extends StatelessWidget {
  const SellProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextWidgets().HeadingText(context, text: 'Sell Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(child: TextFieldWidgets().textFormFieldRound(size)),
                Flexible(child: TextFieldWidgets().textFormFieldRound(size)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
