class DriverFormModel {
  final String name;
  final String nik;
  final String vehiclePlatNumber;
  final String profilePicturePath;

  DriverFormModel({
    required this.name,
    required this.nik,
    required this.vehiclePlatNumber,
    required this.profilePicturePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nik': nik,
      'vehicle_plat_number': vehiclePlatNumber,
      'profile_picture': profilePicturePath,
    };
  }
}
