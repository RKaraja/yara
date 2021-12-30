import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';

class PDFBook extends StatefulWidget {
  final int index;

  PDFBook({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PDFBook> createState() => _PDFBookState();
}

class _PDFBookState extends State<PDFBook> {
  final AddController controller = Get.find();
  final BookController bookController = Get.find();
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  late PdfViewerController _pdfViewerController;
  late PdfPageChangedCallback? onPageChanged;
  PdfPageChangedCallback? get page => page;
  late int pageNumber;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
