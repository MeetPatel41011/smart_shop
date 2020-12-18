import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/models/productModel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
//collection reference
  final CollectionReference shopsCollection =
      Firestore.instance.collection('shops');
  final CollectionReference productsCollection =
      Firestore.instance.collection('products');

  Future updateUserData(String shopName, int noOfProducts) async {
    return await shopsCollection
        .document(uid)
        .setData({'shop_name': shopName, 'no_of_products': noOfProducts});
  }

  Future updateProductData(
      String productName, double price, int quantity) async {
    return await productsCollection.document(uid).setData(
        {'product_name': productName, 'price': price, 'quantity': quantity});
  }

  Stream<List<ProductData>> get brew {
    return shopsCollection.snapshots().map(_brewListFromSnapshot);
  }

  List<ProductData> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductData(
          productName: doc.data['product_name'] ?? '',
          price: doc.data['price'] ?? 0,
          quantity: doc.data['quantity']);
    }).toList();
  }

  UserData _getUserdataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      shopName: snapshot.data['shop_name'],
      noOfProducts: snapshot.data['no_of_products'],
      uid: uid,
    );
  }

  ProductData _getProductDetails(DocumentSnapshot snapshot) {
    return ProductData(
        productName: snapshot.data['product_name'],
        price: snapshot.data['price'],
        quantity: snapshot.data['quantity'],
        pUid: uid);
  }

  Stream<UserData> get userData {
    return shopsCollection
        .document(uid)
        .snapshots()
        .map(_getUserdataFromSnapshot);
  }
}
