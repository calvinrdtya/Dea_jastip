import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justipin/app/core/constants/constant.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';
import 'package:justipin/app/shared/widgets/button/primary_button.dart';
import 'package:justipin/app/shared/widgets/text_field/text_field.dart';
import 'package:justipin/app/core/utils/image_picker_util.dart';
import 'package:justipin/app/features/profile/models/driver_form_model.dart';
import 'package:justipin/app/features/profile/providers/driver_provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';
import 'package:justipin/app/core/screens/success/success_screen.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class DriverRegisterScreen extends StatefulWidget {
  @override
  _DriverRegisterScreenState createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _vehiclePlatNumberController =
      TextEditingController();
  XFile? _profilePicture;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // Check if the user is already registered as a driver but not approved
    if (authProvider.isDriverPendingApproval()) {
      // Navigate to SuccessScreen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SuccessScreen()),
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(title: "Daftar Driver", isBack: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFieldWidget(
                  label: 'Name',
                  controller: _nameController,
                  isPassword: false,
                  obscureText: false),
              TextFieldWidget(
                  label: "NIK",
                  controller: _nikController,
                  isPassword: false,
                  obscureText: false),
              TextFieldWidget(
                  label: 'Plat Nomor Kendaraan',
                  controller: _vehiclePlatNumberController,
                  isPassword: false,
                  obscureText: false),
              _profilePicture == null
                  ? Text('Tidak ada gambar.',
                      style: textTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold))
                  : Image.file(File(_profilePicture!.path)),
              SizedBox(height: 20),
              PrimaryButton(
                buttonText: 'Pilih Gambar',
                onPressed: () => pickImage(context, (pickedFile) {
                  setState(() {
                    _profilePicture = pickedFile;
                  });
                }),
              ),
              SizedBox(height: 20),
              PrimaryButton(
                buttonText: 'Daftar Sekarang',
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      _profilePicture != null) {
                    final form = DriverFormModel(
                      name: _nameController.text,
                      nik: _nikController.text,
                      vehiclePlatNumber: _vehiclePlatNumberController.text,
                      profilePicturePath: _profilePicture!.path,
                    );

                    try {
                      await Provider.of<DriverProvider>(context, listen: false)
                          .submitDriverForm(form);
                      // Handle successful registration
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //       content: Text(
                      //           'Driver registered successfully, please wait for approval')),
                      // );
                      // Navigate to SuccessScreen
                      Navigator.pushReplacementNamed(context, '/success');
                    } catch (e) {
                      // Handle error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Failed to register driver: $e')),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
