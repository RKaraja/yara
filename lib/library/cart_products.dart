import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/library/continue_reading.dart';
import 'package:yara/library/pdf_viewer.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/book_data.dart';

class CartProducts extends StatelessWidget {
  final AddController controller = Get.find();
  final BookController bookController = Get.find();
  //final BookmarkController bookmarkController = Get.find();
  final index;
  CartProducts({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.03),
                height: constraints.maxHeight * 0.18,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.9,
                        width: constraints.maxWidth * 0.25,
                        color: Colors.white,
                        child: FittedBox(
                          child: Text(
                            'All Books',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
              Container(
                height: constraints.maxHeight * 0.815,
                child: LayoutBuilder(builder: (context, constraint) {
                  return Obx(
                    () => ListView.builder(
                      itemCount: controller.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return CartProductCard(
                          controller: controller,
                          product: controller.products.keys.toList()[index],
                          quantity: controller.products.values.toList()[index],
                          index: index,
                          //bookmarkController: bookmarkController,
                          //number: 0,
                        );
                      },
                    ),
                  );
                }),
              )
            ],
          );
        },
        //
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final addController = Get.put(AddController());
  final BookmarkController addBook = Get.put(BookmarkController());
  final BookmarkController bookmarkController = Get.find();
  final BookController bookController = Get.find();
  final AddController controller;
  //final BookmarkController bookmarkController;
  final Product product;
  final int quantity;
  final int index;
  CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
    //required this.bookmarkController,
    //required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        addBook.addBookmark(bookController.products[index]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PDFBook(
                //bookmarkController: bookmarkController,
                index: index,
                //bookController: bookController,
                //page: page,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      product.urlImage,
                      fit: BoxFit.cover,
                      width: size.width * 0.29,
                      height: size.height * 0.23,
                    ),
                  ),
                  Align(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Container(
                        width: size.width * 0.07,
                        height: size.height * 0.05,
                        color: kBeigeColor,
                        child: IconButton(
                          onPressed: () {
                            controller.removeProduct(product);
                            //controller.removeProduct(product);
                            bookmarkController.removeBookmark(product);
                            ContinueReading(
                              index: index,
                            );
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            product.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
