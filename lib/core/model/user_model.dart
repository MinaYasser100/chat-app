class UserModel {
  final String name;
  final String email;
  final String image;

  UserModel({required this.name, required this.email, required this.image});

  factory UserModel.formJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
