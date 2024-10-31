class UserPost {
  final int id;
  final String userName;
  final String timeAgo;
  final String message;
  final String? price;

  UserPost({
    required this.id,
    required this.userName,
    required this.timeAgo,
    required this.message,
    this.price,
  });
}

final List<UserPost> dummyUserPosts = [
  UserPost(
    id: 1,
    userName: "Hanni Pham",
    timeAgo: "1 menit yang lalu",
    message:
        "Guys... ada yang lagi di daerah Sirojudin ga?? mau nitip penggaris di aninda dong.. butuh cepet...",
    price: null,
  ),
  UserPost(
    id: 2,
    userName: "Kang Haerin",
    timeAgo: "5 menit yang lalu",
    message: "Ada yang punya charger laptop? Ketinggalan di rumah.",
    price: null,
  ),
  UserPost(
    id: 3,
    userName: "Danielle",
    timeAgo: "10 menit yang lalu",
    message: "Siapa yang bisa bantuin aku belajar matematika?",
    price: null,
  ),
  UserPost(
    id: 4,
    userName: "Kim Minji",
    timeAgo: "15 menit yang lalu",
    message: "Ada yang jual buku bekas? Butuh buat semester depan.",
    price: 'Rp 15.000',
  ),
];
