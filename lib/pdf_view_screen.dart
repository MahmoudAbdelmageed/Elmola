import 'dart:async';

import 'package:flutter/material.dart';

import 'helper/paths.dart';

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {


 //
 //  bool _isLoading = true;
 // late PDFDocument document;
 //
 //  @override
 //  void initState() {
 //    super.initState();
 //    loadDocument();
 //  }
 //
 //  loadDocument() async {
 //    document = await PDFDocument.fromURL("http://www.pdf995.com/samples/pdf.pdf");
 //
 //    setState(() => _isLoading = false);
 //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
      ),
      body:   PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },

      ).fromAsset('$pdfPath${widget.path}'),

      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _controller.future,
      //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData) {
      //       return FloatingActionButton.extended(
      //         label: Text("Go to ${pages! ~/ 2}"),
      //         onPressed: () async {
      //           await snapshot.data!.setPage(pages! ~/ 2);
      //         },
      //       );
      //     }
      //
      //     return Container();
      //   },
      // ),
    );
  }
}