import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/rounded_button.dart';
import 'package:yara/library/library.dart';
import 'package:yara/store/book_data.dart';
import 'add_controller.dart';
import 'book_controller.dart';

class SearchBookDetails extends StatefulWidget {
  final data;
  final index;
  SearchBookDetails({
    Key? key,
    required this.data,
    this.index,
  }) : super(key: key);

  @override
  State<SearchBookDetails> createState() => _SearchBookDetailsState();
}

class _SearchBookDetailsState extends State<SearchBookDetails> {
  final addController = Get.put(AddController());
  //final addController = Get.put(SearchAddController());
  final BookController bookController = Get.find();
  late String title = widget.data['title'];
  late String genre = widget.data['genre'];
  late int price = widget.data['price'];
  late String urlImage = widget.data['urlImage'];
  late String author = widget.data['author'];
  late String description = widget.data['description'];
  //final index;
  late var data;

  // ({
  //   required this.data,
  // }) : super();
  //get data => data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        elevation: 3,
        toolbarHeight: 60,
        title: Text(
          'YARA',
          style: TextStyle(
            fontFamily: 'moneta',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: 210,
                      height: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          scale: 3.5,
                          image: NetworkImage(urlImage),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      author,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${price}' 'BD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    // RoundedButton(
                    //   text: 'PURCHASE',
                    //   press: () {
                    //     addController
                    //         .addProduct(bookController.products[widget.index]);
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return Library();
                    //         },
                    //       ),
                    //     );
                    //     // addController
                    //     //     .addProduct(bookController.products[index]);
                    //     // Navigator.push(
                    //     //   context,
                    //     //   MaterialPageRoute(
                    //     //     builder: (context) {
                    //     //       return Library();
                    //     //     },
                    //     //   ),
                    //     // );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
