import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:yara/library/cart_products.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/book_details.dart';

import 'add_controller.dart';

class BookSearch extends SearchDelegate<String> {
  final List<String> bookList;
  final List<String> suggestedBooks;
  final AddController controller = Get.find();
  final BookmarkController bookmarkController = Get.find();
  String query = '';

  BookSearch(this.bookList, this.suggestedBooks);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear),
        )
      ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> allBooks = bookList
        .where(
          (book) => book.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: allBooks.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int index) {
        return CartProductCard(
          controller: controller,
          product: controller.products.keys.toList()[index],
          quantity: controller.products.values.toList()[index],
          index: index, bookmarkController: bookmarkController,
          //bookmarkController: bookmarkController,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestedBk = suggestedBooks
        .where(
          (book) => book.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: suggestedBk.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int index) {
        return CartProductCard(
          controller: controller,
          product: controller.products.keys.toList()[index],
          quantity: controller.products.values.toList()[index],
          index: index,
          bookmarkController: bookmarkController,
        );
      },
    );
  }
}
