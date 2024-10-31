import 'package:flutter/material.dart';
import '../../../core/constants/constant.dart';

class SubmitButton extends StatefulWidget {
  final String buttonText;
  final Future<void> Function() onPressed;

  const SubmitButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _isLoading = false;

  void _handlePress() async {
    setState(() {
      _isLoading = true;
    });
    await widget.onPressed();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _handlePress,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isLoading ? Colors.grey : primaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  widget.buttonText,
                  style: textTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                      color: _isLoading ? Colors.black38 : textColor),
                ),
        ),
        if (_isLoading)
          Positioned.fill(
            child: ModalBarrier(
              color: Colors.black.withOpacity(0.3),
              dismissible: false,
            ),
          ),
      ],
    );
  }
}
