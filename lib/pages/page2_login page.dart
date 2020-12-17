import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:smart_shop/pages/page3_Welcome page.dart.dart';

final double _minimumPadding = 5.0;

// ignore: camel_case_types
class page2_loginpage extends StatelessWidget{
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login page'
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding),
        child: ListView(
          children: <Widget>[


            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 27, top: _minimumPadding * 7, bottom: _minimumPadding * 7),
              // flex: 1,
              child: Text(
                'Login please',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 27.0,
                  fontFamily: 'Caveat',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 17, top: _minimumPadding * 7, bottom: _minimumPadding * 7,),
              child: Text(
                'Login with Email :)',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 27.0,
                  fontFamily: 'Caveat',
                ),
              ),
            ),

           Padding(
                  padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, top: _minimumPadding * 2, bottom: _minimumPadding * 2),
                  child: TextField(
                      cursorColor: Colors.blue,

                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'xyz@gmail.com',
                        helperText: 'Enter your E-mail id.',
                        //labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(width: 2, color: Colors.blue,)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: Colors.green)),
                      )

                  ),
                ),



            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, bottom: _minimumPadding * 2),
              child: PasswordField(

                hasFloatingPlaceholder: true,
                pattern: r'.*[@$#.*].*',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 2,)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.green)),
                errorMessage: 'must contain special character either . * @ # \$',
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, bottom: _minimumPadding * 2),
              child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'login',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontFamily: 'Caveat',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page3_Welcomepage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ),

            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 38, right: _minimumPadding * 29, bottom: _minimumPadding * 2),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17.0,
                  fontFamily: 'Caveat',
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, bottom: _minimumPadding * 2),
              // flex: 2,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'Google',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontFamily: 'Caveat',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page3_Welcomepage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ),

            Padding(
              padding: EdgeInsets.only(left: _minimumPadding * 4, right: _minimumPadding * 4, bottom: _minimumPadding * 2),
              // flex: 2,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text(
                    'Facebook',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontFamily: 'Caveat',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page3_Welcomepage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            )

          ],
        ),
      ),

    );
  }

}