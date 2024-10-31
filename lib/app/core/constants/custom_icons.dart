import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomIcons {
  static Widget strokeRoundedEye() {
    return Stack(
      alignment: Alignment.center,
      children: [
        HugeIcon(
            icon: HugeIcons.strokeRoundedEye,
            color: Colors.black), // Ikon mata dari HugeIcons
        Positioned(
          child: CustomPaint(
            size: Size(24, 24), // Sesuaikan ukuran dengan icon
            painter: LinePainter(),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Warna garis coret
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // Gambar garis diagonal dari kiri atas ke kanan bawah
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);

    // Gambar garis diagonal dari kanan atas ke kiri bawah (opsional)
    // canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
