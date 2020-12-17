import 'package:flutter/material.dart';

import 'package:smart_shop/pages/page2_login page.dart';

final double _minimumPadding = 5.0;

// ignore: camel_case_types
class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome'
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            logo(),
          Center(

              child: Text("Smart Shop",
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.blue,
                    fontFamily: 'Caveat',
                  )),
    ),
           Center(
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
                          builder: (context) => page2_loginpage()),

                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
           ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class logo extends StatelessWidget {
  final _minimumPadding = 5.0;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/SharedScreenshot.jpg');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 20),
    );
  }
}
