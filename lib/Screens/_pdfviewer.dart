import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class Pdfviewer extends StatefulWidget {
  Pdfviewer({super.key,
  required this.title,
  required this.url
  });
  String url;
  String title;
  @override
  State<Pdfviewer> createState() => _PdfviewerState();
}

class _PdfviewerState extends State<Pdfviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.url.isNotEmpty? 
      SfPdfViewer.network(widget.url)
      : const  Center(
        child: Text("No Data"),
      )
      ,
    );
  }
}