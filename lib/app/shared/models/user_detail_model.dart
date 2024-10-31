class UserDetailModel {
  final int detailsId;
  final String name;
  final String phoneNumber;
  final String address;
  final String profilePicture;
  final String rating;
  final int orderTotal;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDetailModel({
    required this.detailsId,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.profilePicture,
    required this.rating,
    required this.orderTotal,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      detailsId: json['details_id'] ?? 0,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      address: json['address'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      rating: json['rating'] ?? '0.0',
      orderTotal: json['order_total'] ?? 0,
      userId: json['user_id'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
