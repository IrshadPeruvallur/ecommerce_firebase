import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? title;
  String? subtitile;
  String? category;
  List<String>? wishList;
  List<String>? cart;
  DateTime? timeStamp;
  String? image;
  int? price;
  ProductModel(
      {this.cart,
      this.category,
      this.id,
      this.image,
      this.price,
      this.subtitile,
      this.timeStamp,
      this.title,
      this.wishList});
  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        timeStamp: json['timeStamp'] != null
            ? (json['timeStamp'] as Timestamp).toDate()
            : null,
        cart: List<String>.from(json["cart"] ?? []),
        category: json['catogory'],
        image: json['image'],
        price: json['price'],
        subtitile: json['subtitile'],
        title: json['title'],
        wishList: List<String>.from(json['wishList'] ?? []));
  }

  Map<String, dynamic> toJson() {
    return {
      'cart': cart,
      'catogory': category,
      'id': id,
      'image': image,
      'price': price,
      'subtitile': subtitile,
      'timeStamp': timeStamp,
      'title': title,
      'wishList': wishList,
    };
  }
}
