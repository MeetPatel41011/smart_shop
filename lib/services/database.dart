import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/models/productModel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
//collection reference
  final CollectionReference shopsCollection =
      Firestore.instance.collection('shops');

  Future updateUserData(double price, String productName, int quantity) async {
    return await shopsCollection.document(uid).setData(
        {'price': price, 'product_name': productName, 'quantity': quantity});
  }

  Stream<List<ProductModel>> get brew {
    return shopsCollection.snapshots().map(_brewListFromSnapshot);
  }

  List<ProductModel> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductModel(
          pName: doc.data['product_name'] ?? '',
          price: doc.data['price'] ?? 0,
          quantity: doc.data['quantity']);
    }).toList();
  }

  UserData _getUserdataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      name: snapshot.data['name'],
      shopName: snapshot.data['shop_name'],
      products: snapshot.data['products'],
      uid: uid,
    );
  }

  Stream<UserData> get userData {
    return shopsCollection
        .document(uid)
        .snapshots()
        .map(_getUserdataFromSnapshot);
  }
}
