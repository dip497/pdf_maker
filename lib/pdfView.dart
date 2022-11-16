import "package:flutter/material.dart";
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class pdfView extends StatelessWidget {
  String pdf;
  pdfView({
    Key? key,
    required this.pdf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PdfView(path: pdf);
  }
}
