import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/models/productModel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
//collection reference
  final CollectionReference shopsCollection =
      Firestore.instance.collection('shops');

  Future updateUserData(String shopName, int noOfProducts) async {
    return await shopsCollection
        .document(uid)
        .setData({'shop_name': shopName, 'no_of_products': noOfProducts});
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
      shopName: snapshot.data['shop_name'],
      noOfProducts: snapshot.data['no_of_products'],
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
