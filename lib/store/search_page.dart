import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:yara/components/search_field.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/book_details.dart';
import 'package:yara/store/book_products.dart';
import 'package:yara/store/search_book_details.dart';

class BookSearchPage extends SearchDelegate {
  CollectionReference response =
      FirebaseFirestore.instance.collection('ebooks');

  final addController = Get.put(AddController());
  final BookController bookController = Get.find();
  late int index;
  //late int index;
  late var data;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: response.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['genre']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text('No Books Found'),
              );
            } else {
              return ListView(children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['genre']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String title = data['title'];
                  final String genre = data['genre'];
                  final int price = data['price'];
                  final String urlImage = data['urlImage'];
                  final String author = data['author'];
                  final String description = data['description'];
                  final String ePubBook = data['ePubBook'];
                  final int index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchBookDetails(
                                          //index: index,
                                          data: data,
                                        )));
                          },
                          // => Get.to(() => SearchBookDetails(
                          //       index: null,
                          //     )),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  urlImage,
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
                                    title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(author),
                                  Text(genre),
                                  SizedBox(height: 10),
                                  Text(
                                    '${price}'
                                    'BD',
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
                })
              ]);
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Center(
        child: Text('What are the genres you are looking for?'),
      ),
    );
  }
}
