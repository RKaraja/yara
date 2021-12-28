import 'package:get/get.dart';
import 'package:yara/services/firestore_db.dart';
import 'package:yara/store/book_data.dart';

class BookController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
