import 'package:flutter/material.dart';
import 'package:justipin/app/shared/widgets/primary_app_bar.dart';
import 'package:justipin/app/shared/widgets/button/primary_button.dart';
import 'package:justipin/app/shared/widgets/text_field/text_field.dart';
import 'package:justipin/app/shared/widgets/date_picker_field.dart';
import 'package:justipin/app/shared/widgets/profile_picture_widget.dart';
import 'package:justipin/app/shared/widgets/custom_dropdown.dart';

class DetailProfileScreen extends StatefulWidget {
  const DetailProfileScreen({super.key});

  @override
  _DetailProfileScreenState createState() => _DetailProfileScreenState();
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
  String name = '';
  String? gender;
  DateTime? birthDate;
  String phoneNumber = '';
  String email = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(title: 'Informasi Profil', isBack: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ProfilePictureWidget(),
            const SizedBox(height: 20),
            buildNameField(),
            buildPhoneNumberField(),
            buildEmailField(),
            buildGenderField(),
            buildBirthDateField(),
            PrimaryButton(buttonText: 'Perbarui', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() => TextFieldWidget(
        isPassword: false,
        obscureText: false,
        label: 'Nama',
        controller: _nameController,
      );

  Widget buildGenderField() => CustomDropdown(
        label: 'Jenis Kelamin',
        value: gender,
        items: const [
          DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
          DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
          DropdownMenuItem(value: 'Tas Alfamart', child: Text('Tas Alfamart')),
        ],
        onChanged: (value) {
          setState(() {
            gender = value;
          });
        },
      );

  Widget buildBirthDateField() => DatePickerField(
        label: 'Tanggal Lahir',
        controller: _birthDateController,
        selectedDate: birthDate,
        onDateSelected: (selected) {
          setState(() {
            birthDate = selected;
            _birthDateController.text =
                "${selected.day}-${selected.month}-${selected.year}";
          });
        },
      );

  Widget buildPhoneNumberField() => TextFieldWidget(
        isPassword: false,
        obscureText: false,
        label: 'No. Handphone',
        controller: _phoneNumberController,
      );

  Widget buildEmailField() => TextFieldWidget(
        isPassword: false,
        obscureText: false,
        label: 'Email',
        controller: _emailController,
      );
}
