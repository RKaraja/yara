import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/library/pdf_viewer.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/book_data.dart';

class ContinueReading extends StatelessWidget {
  final AddController controller = Get.find();
  final BookmarkController bookmarkController = Get.find();
  final index;
  ContinueReading({Key? key, this.index}) : super(key: key);

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
                        width: constraints.maxWidth * 0.45,
                        color: Colors.white,
                        child: FittedBox(
                          child: Text(
                            'Continue Reading',
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
                      itemCount: bookmarkController.bookProducts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return ContinueCard(
                          product: bookmarkController.bookProducts.keys
                              .toList()[index],
                          quantity: bookmarkController.bookProducts.values
                              .toList()[index],
                          index: index,
                          count: bookmarkController.bookProducts.keys
                              .toList()[index],
                          bookmarkController: bookmarkController,
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

class ContinueCard extends StatelessWidget {
  final BookController bookController = Get.find();

  final AddController addController = Get.find();
  final BookmarkController bookmarkController;
  final Product product;
  final int quantity;
  final int index;
  final Product count;
  //final BookmarkController bController;
  //final int page;
  ContinueCard({
    Key? key,
    //required this.controller,
    required this.count,
    required this.product,
    required this.quantity,
    required this.index,
    required this.bookmarkController,
    //AddController? controller,
    //required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Get.to(
        () => PDFBook(
          product: product,
          index: index,
        ),
      ),
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
                            bookmarkController.removeBookmark(product);
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
