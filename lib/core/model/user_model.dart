class UserModel {
  final String name;
  final String email;
  final String image;
  final String userId;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.userId,
  });

  factory UserModel.formJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'userId': userId,
    };
  }
}
