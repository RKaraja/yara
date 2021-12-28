import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';

class SearchPDFBook extends StatefulWidget {
  //final int index;
  final int? page;
  final data;
  SearchPDFBook(
      {Key? key,
      //this.index,
      this.page,
      required this.data})
      : super(key: key);

  @override
  State<SearchPDFBook> createState() => _SearchPDFBookState();
}

class _SearchPDFBookState extends State<SearchPDFBook> {
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  final addController = Get.put(AddController());
  final BookController bookController = Get.find();
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
          bookController.products[widget.data].ePubBook,
          controller: _pdfViewerController,
          key: _pdfViewerStateKey,
          pageLayoutMode: PdfPageLayoutMode.single,
          scrollDirection: PdfScrollDirection.horizontal,
          onPageChanged: (PdfPageChangedDetails details) {
            setState(() {
              details.newPageNumber;
              details.isFirstPage;
            });
          },
          onDocumentLoaded: (PdfDocumentLoadedDetails details) {
            setState(() {
              page = _pdfViewerController.pageNumber;
            });
          },
          // onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          //   _pdfBookmark = details.document.bookmarks[page as int];
          // },
        ),
        appBar: AppBar(
          backgroundColor: kBlueColor,
          actions: <Widget>[
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       page = _pdfViewerController.pageNumber;
            //     });
            //   },
            //   icon: const Icon(
            //     Icons.bookmark,
            //     color: Colors.white,
            //   ),
            // ),
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
