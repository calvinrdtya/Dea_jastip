import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/shared/widgets/button/submit_button.dart';
import 'package:justipin/app/shared/widgets/button/text_button.dart';
import 'package:justipin/app/core/utils/image_picker_util.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:justipin/app/features/home/providers/post_provider.dart';
import 'package:justipin/app/shared/widgets/profile_picture_widget.dart';

class PostForm extends StatefulWidget {
  final String userName;
  final String? profilePict;
  final String postHintText;
  final Function(String) onSubmit;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback onSuccess;

  const PostForm({
    super.key,
    required this.userName,
    required this.profilePict,
    required this.postHintText,
    required this.onSubmit,
    required this.onSuccess,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final TextEditingController _controller = TextEditingController();
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserInfo(),
        const SizedBox(height: 20.0),
        _buildTextField(),
        const SizedBox(height: 20.0),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        widget.profilePict != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(widget.profilePict!),
              )
            : ProfilePictureWidget(
                radius: 30.0,
                backgroundColor: primaryColor,
                iconColor: Colors.white,
              ),
        const SizedBox(width: 10.0),
        Text(
          widget.userName,
          style: textTextStyle.copyWith(
              color: textColor, fontWeight: bold, fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.postHintText,
        hintStyle: textTextStyle.copyWith(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
      maxLines: 6,
      keyboardType: TextInputType.multiline,
      style: const TextStyle(fontSize: 18.0),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        CustomTextButton(
          icon: HugeIcons.strokeRoundedImage01,
          text: 'Tambahkan Foto',
          onPressed: () => pickImage(context, (pickedFile) {
            setState(() {
              _selectedImage = pickedFile;
            });
          }),
        ),
        if (_selectedImage != null)
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(
                    File(_selectedImage!.path),
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 20,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImage = null;
                      });
                    },
                    child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCancelSquare,
                        color: Colors.black,
                        size: 35)),
              ),
            ],
          ),
        CustomTextButton(
          icon: HugeIcons.strokeRoundedLocation01,
          text: 'Pilih Lokasi',
          onPressed: () {},
        ),
        _buildPreviewMaps(),
        const SizedBox(height: 20.0),
        SubmitButton(
          buttonText: 'Post',
          onPressed: () async {
            final postProvider =
                Provider.of<PostProvider>(context, listen: false);
            final startTime = DateTime.now().toString();
            try {
              final response = await postProvider.createPost(
                  _controller.text, startTime,
                  imagePath: _selectedImage?.path);
              print('response post: $response');
              if (response != null && response['success'] == true) {
                print('Post created successfully');
                widget.onSuccess();
              } else {
                print('Failed to create post: ${response?['message']}');
              }
            } catch (e) {
              print('Error creating post: $e');
            }
          },
        ),
      ],
    );
  }

  Stack _buildPreviewMaps() {
    return Stack(
      children: [
        Container(
          height: 200,
          color: Colors.grey[200],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  HugeIcons.strokeRoundedLocation01,
                  size: 50,
                  color: textColor,
                ),
                const SizedBox(height: 10),
                Text(
                  'Lokasi Terpilih',
                  style: textTextStyle.copyWith(
                    fontSize: 18.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: () {
              // Add your remove map logic here
            },
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedCancel01,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
