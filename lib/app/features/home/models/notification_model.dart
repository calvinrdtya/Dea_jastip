class NotificationModel {
  final String title;
  final String content;
  final String? time;

  NotificationModel({
    required this.title,
    required this.content,
    required this.time,
  });
}

final List<NotificationModel> notifications = [
  NotificationModel(
    title: 'Paket Tiba',
    content:
        'Paket dengan nomor resi 1234567890 telah tiba di depan pintu Anda.',
    time: '01-10-2024 09:00',
  ),
  NotificationModel(
    title: 'Paket dalam perjalanan',
    content:
        'Kurir sedang menuju lokasi Anda. Harap bersiap untuk menerima paket.',
    time: '01-10-2024 08:30',
  ),
  NotificationModel(
    title: 'Paket Tiba',
    content:
        'Paket dengan nomor resi 0987654321 telah tiba di depan pintu Anda.',
    time: '30-09-2024 14:00',
  ),
  NotificationModel(
    title: 'Paket dalam perjalanan',
    content:
        'Kurir sedang menuju lokasi Anda. Harap bersiap untuk menerima paket.',
    time: '30-09-2024 13:30',
  ),
];
