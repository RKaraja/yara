import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';
import 'package:yara/store/book_data.dart';

// class PDFBook extends StatefulWidget {
//   //final BookmarkController bookmarkController;
//   final index;
//   final AddController controller;
//   //final int? page;
//   PDFBook({Key? key, required this.index, required this.controller
//       //this.page
//       })
//       : super(key: key);
//
//   @override
//   State<PDFBook> createState() => _PDFBookState();
// }
//
// class _PDFBookState extends State<PDFBook> {
//   final BookController bookController = Get.find();
//   final AddController controller = Get.find();
//   final BookmarkController bookmarkController = Get.find();
//   // final addController = Get.put(AddController());
//   // final markController = Get.put(BookmarkController());
//   // final BookController bookController = Get.find();
//   final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
//   late PdfViewerController _pdfViewerController;
//   late PdfPageChangedCallback? onPageChanged;
//
//   @override
//   // void initState() {
//   //   _pdfViewerController = PdfViewerController();
//   //   //pageNumber = page as int;
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SfPdfViewer.network(
//           bookController.products[widget.index].ePubBook,
//           controller: _pdfViewerController,
//           key: _pdfViewerStateKey,
//           pageLayoutMode: PdfPageLayoutMode.single,
//           scrollDirection: PdfScrollDirection.horizontal,
//           onPageChanged: (PdfPageChangedDetails details) {
//             setState(() {
//               details.newPageNumber;
//               details.isFirstPage;
//             });
//           },
//         ),
//         appBar: AppBar(
//           backgroundColor: kBlueColor,
//           actions: <Widget>[
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.play_arrow_rounded,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 _pdfViewerController.previousPage();
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios_rounded,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 _pdfViewerController.nextPage();
//               },
//               icon: Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 _pdfViewerController.zoomLevel = 1.25;
//               },
//               icon: Icon(
//                 Icons.zoom_in,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class PDFBook extends StatefulWidget {
  //final BookmarkController bookmarkController;
  final int index;
  //final BookController bookController;
  //final int? page;
  PDFBook({
    Key? key,
    required this.index,
    //required this.bookController,
    //this.page
  }) : super(key: key);

  @override
  State<PDFBook> createState() => _PDFBookState();
}

class _PDFBookState extends State<PDFBook> {
  final AddController controller = Get.find();
  final BookmarkController bookmarkController = Get.find();
  final addController = Get.put(AddController());
  //final addController = Get.put(AddController());
  final BookController bookController = Get.find();
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  late PdfViewerController _pdfViewerController;
  late PdfPageChangedCallback? onPageChanged;
  //late PdfBookmark _pdfBookmark;
  PdfPageChangedCallback? get page => page;
  late int pageNumber;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    //pageNumber = page as int;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int page = 0;
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.network(
          bookController.products[widget.index].ePubBook,
          controller: _pdfViewerController,
          key: _pdfViewerStateKey,
          pageLayoutMode: PdfPageLayoutMode.single,
          scrollDirection: PdfScrollDirection.horizontal,
        ),
        appBar: AppBar(
          backgroundColor: kBlueColor,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                _pdfViewerController.previousPage();
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                _pdfViewerController.nextPage();
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                _pdfViewerController.zoomLevel = 1.25;
              },
              icon: Icon(
                Icons.zoom_in,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
