import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:justipin/app/core/constants/constant.dart';

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: _buildPages(),
        onDone: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        showSkipButton: true,
        skip: _buildSkipButton(),
        next: _buildNextButton(),
        done: _buildDoneButton(),
        dotsDecorator: _buildDotsDecorator(),
      ),
    );
  }

  List<PageViewModel> _buildPages() {
    return [
      _buildPage(
        title: "Order Food \nwith Ease",
        body:
            "Temukan driver di sekitar Anda untuk mengantarkan makanan favorit dari restoran mana pun.",
        icon: HugeIcons.strokeRoundedShoppingBag02,
        iconColor: Colors.amberAccent,
        pageColor: null,
      ),
      _buildPage(
        title: "Fast and \nSecure Delivery",
        body: "Dapatkan keperlan anda dengan cepat melalui driver terdekat.",
        icon: HugeIcons.strokeRoundedDeliveredSent,
        iconColor: Colors.white,
        pageColor: Colors.amberAccent,
      ),
      _buildPage(
        title: "Freedom to \nChoose Restaurants",
        body:
            "Anda yang memilih restoran,dan \ndriver akan mengantarkan pesanan.",
        icon: HugeIcons.strokeRoundedMenuRestaurant,
        iconColor: Colors.amberAccent,
        pageColor: null,
      ),
    ];
  }

  PageViewModel _buildPage({
    required String title,
    required String body,
    required IconData icon,
    required Color iconColor,
    Color? pageColor,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Center(
          child: HugeIcon(
            icon: icon,
            color: iconColor,
            size: 300.0,
          ),
        ),
      ),
      decoration: PageDecoration(
        pageColor: pageColor,
        titleTextStyle: textTextStyle.copyWith(
          color: pageColor == null ? textColor : Colors.white,
          fontSize: 38.0,
          fontWeight: bold,
        ),
        bodyTextStyle: textTextStyle.copyWith(
          color: pageColor == null ? textColor : Colors.white,
          fontSize: 20.0,
        ),
        contentMargin: const EdgeInsets.only(top: 120.0),
      ),
    );
  }

  Text _buildSkipButton() {
    return Text(
      "Lewati",
      style: textTextStyle.copyWith(
        color: textColor,
        fontWeight: bold,
        fontSize: 20,
      ),
    );
  }

  HugeIcon _buildNextButton() {
    return HugeIcon(
      icon: HugeIcons.strokeRoundedArrowRight01,
      color: textColor,
      size: 20,
    );
  }

  Text _buildDoneButton() {
    return Text(
      "Mulai",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: textColor,
        fontSize: 20,
      ),
    );
  }

  DotsDecorator _buildDotsDecorator() {
    return DotsDecorator(
      size: const Size.square(10.0),
      activeSize: const Size(22.0, 10.0),
      activeColor: textColor,
      color: Colors.black26,
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}
