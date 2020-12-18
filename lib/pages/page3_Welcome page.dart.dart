import 'dart:core';

import 'package:flutter/material.dart';
import 'package:smart_shop/pages/page4.dart';

void main() => runApp(page3_Welcomepage());
final double _minimumPadding = 5.0;

class page3_Welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your Info'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          margin: EdgeInsets.all(_minimumPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Enter shop name',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextFormField(
                  //style: textStyle,
                  decoration: InputDecoration(
                    hintText: 'My Shop',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Total types of products',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Number of Products',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text(
                        'Done',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => page4()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                )
              ],
            ),
          )),
    );
  }
}
