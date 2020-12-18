import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/user.dart';
import 'page1.dart';
import 'page3_Welcome page.dart.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return user == null ? page1() : page3_Welcomepage();
  }
}
