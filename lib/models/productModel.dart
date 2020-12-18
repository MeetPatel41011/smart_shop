class ProductModel {
  final String pUid;
  ProductModel({this.pUid});
}

class ProductData {
  final String pUid;
  final String productName;
  final double price;
  final int quantity;

  ProductData({this.productName, this.price, this.quantity, this.pUid});
}
