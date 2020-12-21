import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/pages/page3_Welcome%20page.dart.dart';
import 'package:smart_shop/services/auth.dart';
import 'package:smart_shop/widgets/loading.dart';

final double _minimumPadding = 5.0;

// ignore: camel_case_types
class page2_loginpage extends StatefulWidget {
  page2_loginpage({this.isLogin = true});
  final bool isLogin;
  @override
  _page2_loginpageState createState() => _page2_loginpageState();
}

// ignore: camel_case_types
class _page2_loginpageState extends State<page2_loginpage> {
  final AuthService _authService = AuthService();
  String email;
  String password;
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.isLogin ? 'Login' : 'Register'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.all(_minimumPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Center(
                          child: Text(
                            widget.isLogin ? 'Login Please' : 'Register Please',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) =>
                            value.isEmpty ? 'Enter an email' : null,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) => value.length < 6
                            ? 'Enter a password of 6 or more characters'
                            : null,
                        obscureText: true,
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: RaisedButton(
                          onPressed: widget.isLogin
                              ? () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    _authService
                                        .signIn(email, password)
                                        .then((user) {
                                      if (user == null) {
                                        setState(() {
                                          loading = false;
                                          error =
                                              'An error occurred, Please try again';
                                        });
                                      }
                                    }).catchError((error) {
                                      print(error.toString());
                                    });
                                  }
                                }
                              : () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic user = await _authService.register(
                                        email, password);
                                    Get.to(page3_Welcomepage());
                                    if (user == null) {
                                      setState(() {
                                        loading = false;
                                        error =
                                            'An error occured, please try again!';
                                      });
                                    }
                                  }
                                },
                          padding: EdgeInsets.all(10),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text(
                            widget.isLogin ? 'Login' : 'Register',
                            textScaleFactor: 1.2,
                            style: TextStyle(),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      error.isEmpty
                          ? Text(
                              '$error',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          : Text(''),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
