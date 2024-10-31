class DriverPost {
  final int id;
  final String driverName;
  final String rating;
  final String timeAgo;
  final String message;
  final String? hasLocation;
  final bool hasImage;
  final String? timeRange;

  DriverPost({
    required this.id,
    required this.driverName,
    required this.rating,
    required this.timeAgo,
    required this.message,
    required this.hasLocation,
    required this.hasImage,
    this.timeRange,
  });
}

final List<DriverPost> dummyDriverPosts = [
  DriverPost(
    id: 1,
    driverName: "king je es",
    rating: '4.5',
    timeAgo: "24 menit yang lalu",
    message: "sapa mau nitip hanni asli koreya 😋😍😘🥰",
    hasLocation: "lagi jalan sama haerin",
    hasImage: true,
    timeRange: "14:30 - 15:15",
  ),
  DriverPost(
    id: 2,
    driverName: "Mbak Siti",
    rating: '3.5',
    timeAgo: "30 menit yang lalu",
    message: "lagi di pasar nih, ada yang mau titip belanjaan?",
    hasLocation: 'di pasar, Yogyakarta',
    hasImage: false,
    timeRange: "10:00 - 11:00",
  ),
  DriverPost(
    id: 3,
    driverName: "Pak Budi",
    rating: '4.2',
    timeAgo: "2 jam yang lalu",
    message: "mau ke kantor pos, ada yang mau titip surat?",
    hasLocation: null,
    hasImage: true,
    timeRange: null,
  ),
  DriverPost(
    id: 4,
    driverName: "Mas Joko",
    rating: '4.8',
    timeAgo: "1 jam yang lalu",
    message: "lagi di toko elektronik, ada yang mau titip barang?",
    hasLocation: "Toko Elektronik, Yogyakarta",
    hasImage: true,
    timeRange: "16:00 - 17:00",
  ),
  DriverPost(
    id: 5,
    driverName: "Mbak Rina",
    rating: '4.0',
    timeAgo: "45 menit yang lalu",
    message: "lagi di toko baju, ada yang mau titip pakaian?",
    hasLocation: "Toko Baju, Yogyakarta",
    hasImage: false,
    timeRange: "12:00 - 13:00",
  ),
];
