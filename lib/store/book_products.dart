import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';
import 'book_details.dart';

class BookProducts extends StatefulWidget {
  BookProducts({Key? key}) : super(key: key);

  @override
  State<BookProducts> createState() => _BookProductsState();
}

class _BookProductsState extends State<BookProducts> {
  final bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: bookController.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogBookCard(index: index);
            }),
      ),
    );
  }
}

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
