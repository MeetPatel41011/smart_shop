import 'package:flutter/material.dart';
import 'package:smart_shop/pages/page5_All%20set%20page.dart';

final double _minimumPadding = 5.0;

// ignore: camel_case_types
class page4 extends StatefulWidget {
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
      appBar: AppBar(title: Text('Smart Shop')),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding,
                      bottom: _minimumPadding,
                      right: _minimumPadding,
                      left: _minimumPadding),
                  child: Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.blue,
                      fontFamily: 'Caveat',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: _minimumPadding,
                    left: _minimumPadding * 10,
                  ),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.blue,
                      fontFamily: 'Caveat',
                    ),
                  ),
                ),
              ],
            ),
            for (int i = 0; i < 4; i++)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // controller: myController,
                          // var in = Repository().placeAddApiProvider(int.parse(_section_id.text)),
                          keyboardType: TextInputType.number,
                          // obscureText: true,
                          //style: textStyle,
                          decoration: InputDecoration(
                              labelText: 'Product Name',
                              hintText: 'Ex. Pen',
                              //labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          // controller: myController,
                          // var in = Repository().placeAddApiProvider(int.parse(_section_id.text)),
                          keyboardType: TextInputType.number,
                          // obscureText: true,
                          //style: textStyle,
                          decoration: InputDecoration(
                              labelText: 'Price',
                              hintText: 'Ex. 250',
                              //labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text(
                  'Done',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page5_allset()),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ],
        ),
      ),
    );
  }
}
