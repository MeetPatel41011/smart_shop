import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/services/database.dart';
import 'page1.dart';
import 'page3_Welcome page.dart.dart';
import 'page4.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<UserData>(
      stream: user == null ? null : DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        final userData = snapshot.data;
        return user == null
            ? page1()
            : page4(
                productCount: userData.noOfProducts, sName: userData.shopName);
      },
    );
  }
}
