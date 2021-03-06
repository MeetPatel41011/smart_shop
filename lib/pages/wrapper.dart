import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/pages/page3_Welcome%20page.dart.dart';
import 'package:smart_shop/pages/page4.dart';
import 'package:smart_shop/services/database.dart';
import 'page1.dart';

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
            : page3_Welcomepage(
                // productCount: userData.noOfProducts,
                // sName: userData.shopName,
                );
      },
    );
  }
}
