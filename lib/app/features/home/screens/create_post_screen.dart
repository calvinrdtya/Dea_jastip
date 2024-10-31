import 'package:flutter/material.dart';
import 'package:justipin/app/features/home/widgets/post/post_form.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';
import 'package:justipin/app/features/home/providers/post_provider.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Buat Postingan'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
          builder: (context, child) {
            final authProvider = Provider.of<AuthProvider>(context);
            final userName = authProvider.driver?.name ??
                authProvider.userDetail?.name ??
                authProvider.user?.name ??
                'User';
            const profilePicture = null;
            return PostForm(
              userName: userName,
              profilePict: profilePicture,
              postHintText: 'Apa yang Anda inginkan?',
              onSubmit: (postText) {
                // Navigator.pushReplacementNamed(context, '/home');
              },
              onSuccess: () {
                print('hit buntton');
                Navigator.pop(context);
              },
              imageWidth: 150, // Custom width for image preview
              imageHeight: 150, // Custom height for image preview
            );
          },
        ),
      ),
    );
  }
}
