import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yara/store/book_data.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection('ebooks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
