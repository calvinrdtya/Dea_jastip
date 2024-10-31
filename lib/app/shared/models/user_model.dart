class UserModel {
  final int userId;
  final String name;
  final String email;
  final String role;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
