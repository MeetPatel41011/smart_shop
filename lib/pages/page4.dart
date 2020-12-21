import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/productModel.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/services/database.dart';
import 'package:smart_shop/widgets/loading.dart';
import 'package:get/get.dart';
import 'page5_All set page.dart';

// ignore: camel_case_types
class page4 extends StatefulWidget {
  page4({@required this.productCount, @required this.sName});
  final int productCount;
  final String sName;
  @override
  State<StatefulWidget> createState() {
    return _page4State();
  }
}

// ignore: camel_case_types
class _page4State extends State<page4> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    int prCount = widget.productCount;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          prCount = prCount + 1;
          await DatabaseService(uid: user.uid)
              .createProductData((prCount).toString());
          await DatabaseService(uid: user.uid).updateUserData(prCount);
          setState(() {
            print('New Product Added');
          });
        },
      ),
      appBar: AppBar(title: Text(widget.sName)),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height - 186 - 30,
                child: ListView.builder(
                  itemCount: prCount,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductDetailsEntry(pUid: index + 1);
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Make sure the checks turn green before Clicking \'Done\'',
                style: TextStyle(color: Colors.green, fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 8, 70, 30),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text('Done'),
                  onPressed: () {
                    Get.to(page5_allset(sName: widget.sName));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsEntry extends StatefulWidget {
  ProductDetailsEntry({@required this.pUid});
  final int pUid;
  @override
  _ProductDetailsEntryState createState() => _ProductDetailsEntryState();
}

class _ProductDetailsEntryState extends State<ProductDetailsEntry> {
  final _formKey = GlobalKey<FormState>();
  Color col = Colors.blue;
  String _productName;
  double _price;
  int _quantity;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<ProductData>(
        stream:
            DatabaseService(uid: user.uid).productData(widget.pUid.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final productData = snapshot.data;
            return Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      initialValue: productData.productName,
                      validator: (value) => value.isEmpty ? 'Product 1' : null,
                      onChanged: (value) {
                        setState(() {
                          _productName = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Product',
                        labelStyle: TextStyle(color: Colors.blue[500]),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: productData.price.toString(),
                      validator: (value) => value.isEmpty ? '-' : null,
                      onChanged: (value) {
                        setState(() {
                          _price = double.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Price',
                        labelStyle: TextStyle(color: Colors.blue[500]),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: productData.quantity.toString(),
                      validator: (value) => value.isEmpty ? '-' : null,
                      onChanged: (value) {
                        setState(() {
                          _quantity = int.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(color: Colors.blue[500]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateProductData(
                          _productName ?? productData.productName,
                          _price ?? productData.price,
                          _quantity ?? productData.quantity,
                          widget.pUid.toString(),
                        );
                        setState(() {
                          col = Colors.green;
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: col,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
