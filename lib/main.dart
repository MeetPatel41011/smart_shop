import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/pages/wrapper.dart';
import 'package:smart_shop/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "Smart Shop",
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
