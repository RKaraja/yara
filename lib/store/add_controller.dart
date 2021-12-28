import 'package:get/get.dart';
import 'package:yara/settings/card_details.dart';
import 'package:yara/store/book_data.dart';

class AddController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Book Added",
      "${product.title} Added to your library",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
}

class BookmarkController extends GetxController {
  var _products = {}.obs;

  void addBookmark(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  void removeBookmark(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
}

// class BookmarkController extends GetxController {
//   var _products = {}.obs;
//   //var _cardDetails = {}.obs;
//
//   void addBookmark(Product product) {
//     if (_products.containsKey(product)) {
//       _products[product] += 1;
//     } else {
//       _products[product] = 1;
//     }
//   }
//
//   void removeBookmark(Product product) {
//     if (_products.containsKey(product) && _products[product] == 1) {
//       _products.removeWhere((key, value) => key == product);
//     } else {
//       _products[product] -= 1;
//     }
//   }
//
//   get products => _products;
// }

// class SearchAddController extends GetxController {
//   //late var data;
//   // SearchAddController({
//   //   required this.data,
//   // }) : super();
//
//   var _products = {}.obs;
//
//   void addProduct(Product data) {
//     if (_products.containsKey(data)) {
//       _products[data] += 1;
//     } else {
//       _products[data] = 1;
//     }
//
//     Get.snackbar(
//       "Book Added",
//       "${data.title} Added to your library",
//       snackPosition: SnackPosition.BOTTOM,
//       duration: Duration(seconds: 3),
//     );
//   }
//
//   void removeProduct(Product data) {
//     if (_products.containsKey(data) && _products[data] == 1) {
//       _products.removeWhere((key, value) => key == data);
//     } else {
//       _products[data] -= 1;
//     }
//   }
//
//   get products => _products;
//   get data => _products;
// }
