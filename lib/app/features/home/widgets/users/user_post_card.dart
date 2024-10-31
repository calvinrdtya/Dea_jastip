import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/features/chat/screens/chat_screen.dart';
import 'package:justipin/app/features/payment/screens/payment.dart';
import 'package:justipin/app/shared/widgets/profile_picture_widget.dart';
import '../../models/user_post_model.dart';
import '../../../../core/constants/constant.dart';

class UserPostCard extends StatelessWidget {
  final UserPost userPost;
  final String userRole;

  const UserPostCard(
      {super.key, required this.userPost, required this.userRole});
      
        get userChat => null;

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
            _buildHeader(),
            const Divider(color: Colors.grey, thickness: 1),
            const Gap(10),
            Text(userPost.message, style: textTextStyle.copyWith(fontSize: 16)),
            const Gap(10),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return ListTile(
      leading: ProfilePictureWidget(
        backgroundColor: primaryColor,
        radius: 25,
      ),
      title: Text(userPost.userName,
          style: textTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle:
          Text(userPost.timeAgo, style: textTextStyle.copyWith(fontSize: 12)),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }

  Widget _buildFooter(BuildContext context) { // Terima context di sini
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (userPost.price != null)
          Text(userPost.price!,
              style: textTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        Row(
          children: [
            if (userPost.price != null)
              _buildActionButton(
                HugeIcons.strokeRoundedTick01,
                'Gass',
                onPressed: () {
                  // Navigasi ke halaman pembayaran
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentScreen()), // Ganti dengan nama halaman pembayaran yang sesuai
                  );
                },
              ),
            const Gap(10),
            _buildActionButton(
              HugeIcons.strokeRoundedBubbleChat,
              'Chat',
              onPressed: () {
                // Navigasi ke halaman chat   
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chat: userChat), // Berikan objek Chat yang sesuai
                ),
              );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, {required Null Function() onPressed}) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      icon: HugeIcon(icon: icon, color: Colors.black, size: 18),
      label: Text(label,
          style: textTextStyle.copyWith(
              fontSize: 14, color: textColor, fontWeight: bold)),
    );
  }
}
