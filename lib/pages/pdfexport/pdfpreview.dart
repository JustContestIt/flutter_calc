import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:printing/printing.dart';
import '../../models/data.dart';
import 'pdf/pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  final Data data;
  const PdfPreviewPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(data),
      ),
    );
  }
}
