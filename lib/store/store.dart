import 'dart:async';
//import 'dart:html';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/components/search_field.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/book_data.dart';
import 'package:yara/store/book_products.dart';
import 'package:yara/store/search_page.dart';

class Store extends StatefulWidget {
  Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final AddController controller = Get.find();
  final bookController = Get.put(BookController());
  late String query;
  CollectionReference response =
      FirebaseFirestore.instance.collection('ebooks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          showSearch(
            context: context,
            delegate: BookSearchPage(),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search(
            //     text: query,
            //     onChanged: showSearch(context: context, delegate: BookSearchPage()),
            //     hintText: 'Search by genre'),
            BookProducts(),
          ],
        ),
      ),
    );
  }

  // Widget buildResults(BuildContext context){
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: response.snapshots().asBroadcastStream(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
  //       if(!snapshot.hasData){
  //         return Center(child: CircularProgressIndicator());
  //       }
  //       else {
  //         if (snapshot.data!.docs
  //             .where((QueryDocumentSnapshot<Object?> element) =>
  //             element['genre']
  //                 .toString()
  //                 .toLowerCase()
  //                 .contains(query.toLowerCase()))
  //             .isEmpty) {
  //           return Center(
  //             child: Text('No Books Found'),
  //           );
  //         } else {
  //           return ListView(children: [
  //             ...snapshot.data!.docs
  //                 .where((QueryDocumentSnapshot<Object?> element) =>
  //                     element['genre']
  //                         .toString()
  //                         .toLowerCase()
  //                         .contains(query.toLowerCase()))
  //             .map((QueryDocumentSnapshot<Object?> data){
  //             final String title = data['title'];
  //             final String genre = data['genre'];
  //             //final int price = data[];
  //             final String urlImage = data['urlImage'];
  //             final String author = data['author'];
  //
  //             return ListTile(
  //         onTap: (){},
  //         title: Text(title),
  //         leading: CircleAvatar(
  //         backgroundImage: NetworkImage(urlImage),
  //         ),
  //         subtitle: Text(author),
  //         );
  //             })
  //           ]);
  //         }
  //       }
  //     }
  //   );
  // }
}

// class BooksApi {
//   static Future<List> getBooks(String query) async {
//     CollectionReference response =
//         await FirebaseFirestore.instance.collection('ebooks');
//
//     if (response == ConnectionState.done) {
//       QuerySnapshot querySnapshot = await response.get();
//       final List books = querySnapshot.docs.map((doc) => doc.data()).toList();
//
//       return books
//           .map((snapshot) => Product.fromSnapshot(snapshot))
//           .where((product) {
//         final titleLower = product.title.toLowerCase();
//         final authorLower = product.genre.toLowerCase();
//         final searchLower = query.toLowerCase();
//
//         return titleLower.contains(searchLower) ||
//             authorLower.contains(searchLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }
// }
