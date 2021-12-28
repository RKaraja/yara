import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:yara/store/book_details.dart';

import 'add_controller.dart';
import 'book_controller.dart';

class CatalogBookCard extends StatelessWidget {
  final addController = Get.put(AddController());
  final BookController bookController = Get.find();
  final int index;
  CatalogBookCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final int index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () => Get.to(() => BookDetails(
                  index: index,
                )),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    bookController.products[index].urlImage,
                    fit: BoxFit.cover,
                    width: 90,
                    height: 120,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookController.products[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(bookController.products[index].author),
                    Text(bookController.products[index].genre),
                    SizedBox(height: 10),
                    Text(
                      '${bookController.products[index].price}' 'BD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.black26,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
