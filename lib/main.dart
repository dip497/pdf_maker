import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_maker/pdfView.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geeksforgeeks"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blueGrey,
                child: Text(
                  'Preview PDF',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Center(
                          child: pw.Text("Hello World"),
                        ); // Center
                      }));
                  await savePdf();

                  // Directory documentDirectory =
                  //     await getApplicationDocumentsDirectory();

                  // String documentPath = documentDirectory.path;

                  // String fullPath = "$documentPath/example.pdf";

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pdfView(
                                pdf: fullPath,
                              )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  writeOnPdf() {}

  Future savePdf() async {
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
    // file.writeAsBytesSync(pdf.save());
  }
}
