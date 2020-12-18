class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String shopName;
  final int products;
  UserData({this.name, this.products, this.shopName, this.uid});
}
