import 'dart:core';

import 'package:flutter/material.dart';
import 'package:smart_shop/pages/page4.dart';

void main() => runApp(page3_Welcomepage());
final double _minimumPadding = 5.0;

class page3_Welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}


class _MyCustomFormState extends State<MyCustomForm> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Enter your info'),
        ),
        body: Container(
          margin: EdgeInsets.all(_minimumPadding),
          child: ListView(
            children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: _minimumPadding * 27, top: _minimumPadding * 7, bottom: _minimumPadding * 7),
          // flex: 1,
          child: Text(
            'Welcome',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 35.0,
                fontFamily: 'Caveat',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, top: _minimumPadding * 2, bottom: _minimumPadding * 2),
          // flex: 1,
          child: Text(
            'Enter shop name',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 35.0,
              fontFamily: 'Caveat',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, top: _minimumPadding * 2, bottom: _minimumPadding * 2),
          child: TextField(
            //style: textStyle,
            decoration: InputDecoration(
                labelText: 'Shop name',
                hintText: 'My shop',
                //labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, top: _minimumPadding * 2, bottom: _minimumPadding * 2),
          // flex: 1,
          child: Text(
            'Total types of products',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 35.0,
              fontFamily: 'Caveat'
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, top: _minimumPadding * 2, bottom: _minimumPadding * 2),
          child: TextField(
            // controller: myController,
            // var in = Repository().placeAddApiProvider(int.parse(_section_id.text)),
            keyboardType: TextInputType.number,
            // obscureText: true,
            //style: textStyle,
            decoration: InputDecoration(
                labelText: 'Total types of products',
                hintText: 'Ex. 7',
                //labelStyle: textStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, top: _minimumPadding * 2, bottom: _minimumPadding * 2),
          child: RaisedButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text(
                'Login',
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontFamily: 'Caveat',
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => page4()),

                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
        )
        ],
    )
    ),
    ),
    );
  }
}
