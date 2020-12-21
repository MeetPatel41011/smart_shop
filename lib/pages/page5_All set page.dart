import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/pages/page6_Product%20list.dart';

// ignore: camel_case_types
class page5_allset extends StatefulWidget {
  page5_allset({@required this.sName});
  final String sName;
  @override
  State<StatefulWidget> createState() {
    return _page5State();
  }
}

// ignore: camel_case_types
class _page5State extends State<page5_allset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sName),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(70, 30, 70, 30),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
          color: Colors.blueAccent,
          textColor: Colors.white,
          child: Text('Done'),
          onPressed: () {
            Get.off(page6_product_list(sName: widget.sName));
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.done_all_rounded,
                color: Colors.green,
                size: 190,
              ),
              Text(
                'All Set!!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Caveat',
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
