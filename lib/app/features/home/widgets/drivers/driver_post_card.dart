import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/shared/widgets/profile_picture_widget.dart';
import 'package:justipin/app/shared/widgets/button/text_button.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/features/home/models/driver_post_model.dart';
import 'package:justipin/app/features/chat/models/chat_model.dart';
import 'package:shimmer/shimmer.dart';

class DriverPostCard extends StatelessWidget {
  final DriverPost driverPost;
  final String userRole; // Add userRole parameter

  const DriverPostCard(
      {Key? key, required this.driverPost, required this.userRole})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: accentColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListTile(),
            const Divider(thickness: 1, color: Colors.grey),
            const Gap(10),
            Text(driverPost.message,
                style: textTextStyle.copyWith(fontSize: 16)),
            const Gap(3),
            if (driverPost.hasLocation != null)
              CustomTextButton(
                  icon: HugeIcons.strokeRoundedLocation01,
                  text: driverPost.hasLocation ?? '',
                  onPressed: () {}),
            const Gap(3),
            if (driverPost.hasImage) _buildImage(),
            const Gap(10),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile() {
    return ListTile(
      leading: ProfilePictureWidget(
        backgroundColor: primaryColor,
        radius: 25,
      ),
      title: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: constraints.maxWidth - 60),
                child: Text(
                  driverPost.driverName,
                  style: textTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Gap(8),
              const Icon(Icons.star, color: Colors.amber, size: 16),
              Text(driverPost.rating,
                  style: textTextStyle.copyWith(fontSize: 16)),
            ],
          );
        },
      ),
      subtitle:
          Text(driverPost.timeAgo, style: textTextStyle.copyWith(fontSize: 12)),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: double.infinity,
        child: Image.network(
          'http://10.0.2.2:8000/storage/images/JusTip_20241025-151235.jpg',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 200, // atur tinggi gambar sesuai kebutuhan
                color: Colors.grey[300],
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, color: Colors.red, size: 50),
                  const SizedBox(height: 8),
                  Text(
                    "Tidak dapat dimuat, cek koneksi internet",
                    style: textTextStyle.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (driverPost.timeRange != null)
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(driverPost.timeRange!,
                style: textTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        const Spacer(),
        if (userRole != 'Driver')
          ElevatedButton.icon(
            onPressed: () {
              final user = users.firstWhere(
                (user) => user.username == driverPost.driverName,
                orElse: () {
                  final newUser = User(
                    id: (users.length + 1).toString(),
                    username: driverPost.driverName,
                  );
                  users.add(newUser);
                  return newUser;
                },
              );

              final chat = chats.firstWhere(
                (chat) => chat.participants.contains(user.id),
                orElse: () {
                  final newChat = Chat(
                    id: 'new_chat_${user.id}',
                    participants: ['1', user.id],
                    messages: [],
                  );
                  chats.add(newChat);
                  return newChat;
                },
              );

              Navigator.pushNamed(
                context,
                '/chat',
                arguments: chat,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            icon: HugeIcon(
                icon: HugeIcons.strokeRoundedBubbleChat,
                color: textColor,
                size: 16),
            label: Text('Mau Nitip!!',
                style: textTextStyle.copyWith(
                    fontSize: 14, color: textColor, fontWeight: bold)),
          ),
      ],
    );
  }
}
