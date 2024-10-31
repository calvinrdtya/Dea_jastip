class User {
  final String id;
  final String username;

  User({
    required this.id,
    required this.username,
  });
}

class Message {
  final String senderId;
  final String message;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.message,
    required this.timestamp,
  });
}

class Chat {
  final String id;
  final List<String> participants;
  final List<Message> messages;

  Chat({
    required this.id,
    required this.participants,
    required this.messages,
  });
}

// Dummy data users (user dan beberapa driver)
final users = [
  User(id: '1', username: 'User'),
  User(id: '2', username: 'Mas Amba'),
  User(id: '3', username: 'Mbak Siti'),
  User(id: '4', username: 'Pak Budi'),
  User(id: '5', username: 'Pak Eko'),
];

// Pesan dari chat dengan Mas Amba
final messagesAmba = [
  Message(
      senderId: '1', // User
      message: 'Mas Amba, masih bisa nitip muwani kah?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 15))),
  Message(
      senderId: '2', // Mas Amba
      message: 'Iya, bisa banget! Titip apa aja?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 14))),
  Message(
      senderId: '1', // User
      message: 'Minta tolong nitipin 2 bungkus muwani, ya!',
      timestamp: DateTime.now().subtract(const Duration(minutes: 13))),
  Message(
      senderId: '2', // Mas Amba
      message: 'Oke, bakal gw beliin sekarang. Ntar infokan lagi kalau udah.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 12))),
  Message(
      senderId: '2', // Mas Amba
      message: 'Lagi di Sirojudin nih, 10 menit lagi nyampe tempat belinya.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 10))),
];

// Pesan dari chat dengan Mbak Siti
final messagesSiti = [
  Message(
      senderId: '1', // User
      message: 'Mbak Siti, masih di pasar ga? Mau nitip sayur nih.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30))),
  Message(
      senderId: '3', // Mbak Siti
      message: 'Masih, mau nitip apa aja?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 29))),
  Message(
      senderId: '1', // User
      message: 'Nitipin sayur kangkung dan bawang merah ya.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 28))),
  Message(
      senderId: '3', // Mbak Siti
      message: 'Oke, lagi di pasar nih, gw beliin sekarang.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 27))),
];

// Pesan dari chat dengan Pak Budi
final messagesBudi = [
  Message(
      senderId: '1', // User
      message: 'Pak Budi, masih bisa titip surat ga?',
      timestamp: DateTime.now().subtract(const Duration(hours: 1))),
  Message(
      senderId: '4', // Pak Budi
      message: 'Masih bisa, kebetulan gw lagi mau ke kantor pos.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1))),
  Message(
      senderId: '1', // User
      message: 'Tolong titip surat buat temen di Jakarta ya.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1))),
  Message(
      senderId: '4', // Pak Budi
      message: 'Oke, ntar langsung gw kirim pas udah di pos.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1))),
];

final messagesEko = [
  Message(
      senderId: '1', // User
      message: 'Pak Eko, bisa nitip barang ga?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 45))),
  Message(
      senderId: '5', // Pak Eko
      message: 'Bisa, mau nitip apa?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 44))),
  Message(
      senderId: '1', // User
      message: 'Nitipin barang dari toko sebelah ya.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 43))),
  Message(
      senderId: '5', // Pak Eko
      message: 'Oke, gw ambil sekarang.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 42))),
];

// Dummy data chat list (History chat dengan beberapa driver)
final chats = [
  Chat(
      id: 'chat1',
      participants: ['1', '2'],
      messages: messagesAmba), // User & Mas Amba
  Chat(
      id: 'chat2',
      participants: ['1', '3'],
      messages: messagesSiti), // User & Mbak Siti
  Chat(
      id: 'chat3',
      participants: ['1', '4'],
      messages: messagesBudi), // User & Pak Budi
  Chat(
      id: 'chat4',
      participants: ['1', '5'],
      messages: messagesEko), // User & Pak Budi
];
