import 'package:flutter/material.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';
import 'package:justipin/app/features/profile/widgets/setting_text.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/shared/widgets/button/icon_text_button.dart';

class RecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(title: 'Rekomendasikan ke teman', isBack: true),
      body: Column(
        children: [
          SettingText(
            title: 'Rekomendasikan ke teman cobain Justip, yuk!',
            subtitle:
                'Biar mereka juga bisa ngerasain enaknya dibantuin ini itu sama Justip.',
          ),
          Center(
            child: CustomIconTextButton(
              buttonText: 'Ajak teman pakai JusTip',
              onPressed: () {},
              icon: HugeIcons.strokeRoundedUserAdd01,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
