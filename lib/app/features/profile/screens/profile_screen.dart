import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/features/profile/widgets/profile_card.dart';
import 'package:justipin/app/shared/widgets/nav_bar.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';
import 'package:justipin/app/shared/widgets/button/text_button.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.driver?.name ??
        authProvider.userDetail?.name ??
        authProvider.user?.name ??
        'User';
    final userRole = authProvider.driver != null ? 'Driver' : 'User';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PrimaryAppBar(title: 'Profil'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileCard(name: userName, role: userRole),
          ),
          // List Opsi
          Expanded(
            child: Column(
              children: [
                CustomTextButton(
                    icon: HugeIcons.strokeRoundedUser,
                    text: 'Informasi Profil',
                    height: 35,
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile-detail');
                    }),
                CustomTextButton(
                    icon: HugeIcons.strokeRoundedLocation01,
                    text: 'Lokasi',
                    height: 35,
                    onPressed: () {}),
                CustomTextButton(
                    icon: HugeIcons.strokeRoundedPayment01,
                    text: 'Metode Pembayaran',
                    height: 35,
                    onPressed: () {}),
                CustomTextButton(
                    icon: HugeIcons.strokeRoundedUserGroup,
                    text: "Rekomendasikan ke teman",
                    height: 35,
                    onPressed: () {
                      Navigator.pushNamed(context, '/recommend');
                    }),
                if (userRole != 'Driver')
                  CustomTextButton(
                      icon: HugeIcons.strokeRoundedMotorbike02,
                      text: "Daftar sebagai Driver",
                      height: 35,
                      onPressed: () {
                        Navigator.pushNamed(context, '/driver-register');
                      }),
                CustomTextButton(
                    icon: HugeIcons.strokeRoundedSettings01,
                    text: 'Pengaturan',
                    height: 35,
                    onPressed: () {}),
                CustomTextButton(
                    icon: HugeIcons.strokeRoundedHelpCircle,
                    text: 'Bantuan',
                    height: 35,
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    }),
                CustomTextButton(
                  icon: HugeIcons.strokeRoundedLogout01,
                  text: 'Keluar',
                  height: 35,
                  onPressed: () async {
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);
                    await authProvider.logout();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
