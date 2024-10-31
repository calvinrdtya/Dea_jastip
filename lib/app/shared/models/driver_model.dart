class DriverModel {
  final int driverId;
  final String name;
  final String phoneNumber;
  final String nik;
  final String vehicleType;
  final String vehiclePlatNumber;
  final String profilePicture;
  final bool isApproved;
  final String rating;
  final int orderTotal;
  final int kilometers;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  DriverModel({
    required this.driverId,
    required this.name,
    required this.phoneNumber,
    required this.nik,
    required this.vehicleType,
    required this.vehiclePlatNumber,
    required this.profilePicture,
    required this.isApproved,
    required this.rating,
    required this.orderTotal,
    required this.kilometers,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      driverId: json['driver_id'] ?? 0,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      nik: json['nik'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
      vehiclePlatNumber: json['vehicle_plat_number'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      isApproved: json['isApproved'] ?? false,
      rating: json['rating'] ?? '0.00',
      orderTotal: json['order_total'] ?? 0,
      kilometers: json['kilometers'] ?? 0,
      userId: json['user_id'] ?? 0,
      createdAt:
          DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      updatedAt:
          DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
    );
  }
}
