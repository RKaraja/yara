import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/library/continue_reading.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/library/cart_products.dart';
import 'package:yara/store/book_details.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CartProducts(),
            ContinueReading(),
          ],
        ),
      ),
    );
  }
}
