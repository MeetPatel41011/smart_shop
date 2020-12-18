import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/models/productModel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
//collection reference
  final CollectionReference shopsCollection =
      Firestore.instance.collection('shops');

  Future updateUserData(String sugars, String name, int strength) async {
    return await shopsCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  Stream<List<ProductModel>> get brew {
    return shopsCollection.snapshots().map(_brewListFromSnapshot);
  }

  List<ProductModel> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductModel(
          pName: doc.data['name'] ?? '',
          price: doc.data['strength'] ?? 100,
          quantity: doc.data['sugars']);
    }).toList();
  }

  UserData _getUserdataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      name: snapshot.data['name'],
      shopName: snapshot.data['shopname'],
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
