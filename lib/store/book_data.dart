import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final int price;
  final String title;
  final String author;
  final String genre;
  final String urlImage;
  final String description;
  final String ePubBook;

  const Product({
    required this.price,
    required this.title,
    required this.author,
    required this.urlImage,
    required this.description,
    required this.genre,
    required this.ePubBook,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      price: snap['price'],
      title: snap['title'],
      author: snap['author'],
      urlImage: snap['urlImage'],
      description: snap['description'],
      genre: snap['genre'],
      ePubBook: snap['ePubBook'],
    );
    return product;
  }
}
