// AuthenticationModel.dart

class AuthenticationModel {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;

  AuthenticationModel({
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.userId,
  });

  // Factory method to create an AuthenticationModel instance from JSON data
  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
    );
  }

  // Method to convert an AuthenticationModel instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'userId': userId,
    };
  }
}
