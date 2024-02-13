import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? title;
  String? subtitile;
  String? catogory;
  List<String>? wishList;
  List<String>? cart;
  DateTime? timeStamp;
  String? image;
  int? price;
  ProductModel(
      {this.cart,
      this.catogory,
      this.id,
      this.image,
      this.price,
      this.subtitile,
      this.timeStamp,
      this.title,
      this.wishList});
  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    return ProductModel(
        id: id,
        timeStamp: json['timeStamp'] != null
            ? (json['timeStamp'] as Timestamp).toDate()
            : null,
        cart: List<String>.from(json["cart"] ?? []),
        catogory: json['catogory'],
        image: json['image'],
        price: json['price'],
        subtitile: json['subtitile'],
        title: json['title'],
        wishList: List<String>.from(json['wishList'] ?? []));
  }
}
