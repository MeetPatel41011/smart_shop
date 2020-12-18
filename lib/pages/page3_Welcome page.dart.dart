import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/services/database.dart';
import 'package:smart_shop/widgets/loading.dart';

void main() => runApp(page3_Welcomepage());
final double _minimumPadding = 5.0;

class page3_Welcomepage extends StatefulWidget {
  @override
  _page3_WelcomepageState createState() => _page3_WelcomepageState();
}

class _page3_WelcomepageState extends State<page3_Welcomepage> {
  final _formKey = GlobalKey<FormState>();

  String _shopName;
  String _noOfProducts;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title: Text('Enter your Info'),
              ),
              body: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  margin: EdgeInsets.all(_minimumPadding),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(50),
                              child: Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Enter shop name',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextFormField(
                            initialValue: userData.shopName,
                            validator: (value) =>
                                value.isEmpty ? 'New Shop' : null,
                            onChanged: (value) {
                              setState(() {
                                _shopName = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'My Shop',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            'Total types of products',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: userData.noOfProducts.toString(),
                            validator: (value) => value.isEmpty ? '-' : null,
                            onChanged: (value) {
                              setState(() {
                                _noOfProducts = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Number of Products',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              child: Text(
                                'Done',
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: user.uid)
                                      .updateUserData(
                                    _shopName ?? userData.shopName,
                                    _noOfProducts ?? userData.noOfProducts,
                                  );
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            );
          } else {
            return Loading();
          }
        });
  }
}
