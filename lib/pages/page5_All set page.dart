import 'package:flutter/material.dart';
final double _minimumPadding = 5.0;

class page5_allset extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _page5State();
  }

}

class _page5State extends State<page5_allset>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Shop'),
      ),
      body: Center(
      child: Container(
        child:
            Text('All Set..!!',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Caveat',
              color: Colors.blue,
            ),
            )
      ),
      ),
    );
  }

}