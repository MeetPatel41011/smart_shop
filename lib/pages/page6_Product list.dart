import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/productModel.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/services/auth.dart';
import 'package:smart_shop/services/database.dart';
import 'package:smart_shop/widgets/loading.dart';

import 'page4.dart';

// ignore: camel_case_types
class page6_product_list extends StatelessWidget {
  page6_product_list({this.sName, this.productCount});
  final String sName;
  final int productCount;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green),
                child: Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.off(page4(productCount: productCount, sName: sName));
              },
            ),
            Spacer(),
            FloatingActionButton(
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {
                //  Open Camera
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          sName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await _auth.signOut();
            },
            child: Center(child: Text('SignOut')),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int index) {
          return DisplayBox(pUid: index + 1);
        },
      ),
    );
  }
}

class DisplayBox extends StatelessWidget {
  DisplayBox({this.pUid});
  final int pUid;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<ProductData>(
        stream: DatabaseService(uid: user.uid).productData(pUid.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final productData = snapshot.data;
            return Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${productData.productName[0].toUpperCase()}${productData.productName.substring(1)}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rs ${productData.price.toString()}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            productData.quantity.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
