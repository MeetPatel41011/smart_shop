import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_shop/pages/page2_login page.dart';

import 'page2_login page.dart';

final double _minimumPadding = 5.0;

// ignore: camel_case_types
class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            logo(),
            Center(
              child: Text("Smart Shop",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontFamily: 'Caveat',
                  )),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'Register',
                    textScaleFactor: 1.2,
                  ),
                  onPressed: () {
                    Get.to(page2_loginpage(isLogin: false));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(width: 20),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                  color: Colors.blueAccent[700],
                  textColor: Colors.white,
                  child: Text(
                    'Login',
                    textScaleFactor: 1.2,
                  ),
                  onPressed: () {
                    Get.to(page2_loginpage());
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ],
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
