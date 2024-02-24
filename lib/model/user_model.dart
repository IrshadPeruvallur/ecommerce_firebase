class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? userProfile;

  UserModel({
    required this.email,
    required this.name,
    this.phoneNumber,
    this.address,
    this.userProfile,
    required this.uId,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      userProfile: json['userProfile'],
      uId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'userProfile': userProfile,
      'userId': uId,
    };
  }
}
