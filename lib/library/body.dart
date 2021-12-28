import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/components/search_field.dart';
import 'package:yara/library/continue_reading.dart';
import 'package:yara/library/search_card_product.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/library/cart_products.dart';

class Body extends StatelessWidget {
  final AddController controller = Get.find();
  //late var data;

  final index;
  Body({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CartProducts(
                //index: index,
                ),
            //SearchCartProducts(data: data),
            ContinueReading(
                //index: index,
                ),
          ],
        ),
      ),
    );
  }
}

// class Body extends StatefulWidget {
//   //final int index;
//   const Body({
//     Key? key,
//     //required this.index
//   }) : super(key: key);
//
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   final AddController controller = Get.find();
//   late var data;
//
//   var index;
//   //late int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             CartProducts(
//               index: index,
//             ),
//             //SearchCartProducts(data: data),
//             ContinueReading(),
//           ],
//         ),
//       ),
//     );
//   }
// }
