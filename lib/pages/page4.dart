import 'package:flutter/material.dart';

final double _minimumPadding = 5.0;

// ignore: camel_case_types
class page4 extends StatefulWidget {
  page4({@required this.productCount, @required this.sName});
  final int productCount;
  final String sName;
  @override
  State<StatefulWidget> createState() {
    return _page4State();
  }
}

// ignore: camel_case_types
class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sName)),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
      ),
    );
  }
}
