import 'package:flutter/material.dart';
import 'transition_routes.dart';
import 'package:justipin/app/core/splash/splash_screen.dart';

import 'package:justipin/app/features/authentication/screens/introduction_screen.dart';
import 'package:justipin/app/features/authentication/screens/login_screen.dart';
import 'package:justipin/app/features/authentication/screens/register_screen.dart';
// import 'package:justipin/app/features/authentication/screens/logout_screen.dart';
import 'package:justipin/app/features/profile/screens/profile_screen.dart';
import 'package:justipin/app/features/profile/screens/profile_detail_screen.dart';
import 'package:justipin/app/features/profile/screens/recommend_screen.dart';
import 'package:justipin/app/features/profile/screens/contact_us_screen.dart';
import 'package:justipin/app/features/profile/screens/driver_register_screen.dart';

import 'package:justipin/app/features/home/screens/home_screen.dart';
import 'package:justipin/app/features/home/screens/notification_screen.dart';
import 'package:justipin/app/features/home/screens/create_post_screen.dart';
import 'package:justipin/app/features/chat/screens/chat_screen.dart';
import 'package:justipin/app/features/chat/models/chat_model.dart';
import 'package:justipin/app/features/chat/screens/list_chat_screen.dart';

import 'package:justipin/app/core/screens/errors/not_found_screen.dart';
import 'package:justipin/app/core/screens/success/success_screen.dart';

import 'package:justipin/app/features/location/screens/location_screen.dart';
import 'package:justipin/app/features/location/screens/location_maps_screen.dart';
import 'package:justipin/app/features/location/screens/select_location_screen.dart';

import 'package:justipin/app/features/payment/screens/payment.dart';
import 'package:justipin/app/features/payment/screens/order_success.dart';
import 'package:justipin/app/features/payment/screens/order_tracking.dart';


class AppRoutes {
  static const String splash = '/';
  static const String introduction = '/introduction';
  static const String login = '/login';
  static const String register = '/register';
  // static const String logout = '/logout';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String profileDetail = '/profile-detail';
  static const String recommend = '/recommend';
  static const String contactUs = '/contact-us';
  static const String driverRegister = '/driver-register';
  static const String notification = '/notification';
  static const String post = '/create-post';
  static const String chat = '/chat';
  static const String listChat = '/list-chat';
  static const String location = '/location';
  static const String locationMaps = '/location-maps';
  static const String selectLocation = '/select-location';
  static const String payment = '/payment';
  static const String orderSuccess = '/order_success';
  static const String orderTracking = '/order_tracking';

  static const String success = '/success';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Widget page;
    final Route<dynamic> route;

    switch (settings.name) {
      case splash:
        page = const SplashScreen();
        route = fadeRoute(page);
        break;
      case introduction:
        page = const IntroductionScreenPage();
        route = fadeRoute(page);
        break;
      case login:
        page = const LoginPage();
        route = fadeRoute(page);
        break;
      case register:
        page = const RegisterPage();
        route = noTransitionRoute(page);
        break;
      // case logout:
      //   page = const LogoutScreen();
      //   route = slideUpRoute(page);
      //   break;
      case home:
        page = DashboardScreen();
        route = noTransitionRoute(page);
        break;
      case profile:
        page = const ProfileScreen();
        route = noTransitionRoute(page);
        break;
      case profileDetail:
        page = const DetailProfileScreen();
        route = slideRightRoute(page);
        break;
      case recommend:
        page = RecommendScreen();
        route = slideRightRoute(page);
        break;
      case contactUs:
        page = ContactUsScreen();
        route = slideRightRoute(page);
        break;
      case driverRegister:
        page = DriverRegisterScreen();
        route = noTransitionRoute(page);
        break;
      case notification:
        page = const NotificationPage();
        route = slideRightRoute(page);
        break;
      case post:
        page = const CreatePostPage();
        route = slideUpRoute(page);
        break;
      case chat:
        final chat = settings.arguments as Chat;
        page = ChatScreen(chat: chat);
        route = slideRightRoute(page);
        break;
      case listChat:
        page = ListChatScreen();
        route = noTransitionRoute(page);
        break;
      case success:
        page = const SuccessScreen();
        route = slideUpRoute(page);
        break;
      case selectLocation:
        page =  SelectLocationScreen as Widget;
        route = MaterialPageRoute(builder: (_) => page);
        break;
      case locationMaps:
        page =  LocationMapsScreen();
        route = MaterialPageRoute(builder: (_) => page);
        break;
      case location:
        page = const LocationScreen();
        route = MaterialPageRoute(builder: (_) => page);
        break;
      case payment:
        page = const PaymentScreen();
        route = MaterialPageRoute(builder: (_) => page);
        break;
      case orderSuccess:
        page = const OrderSuccessScreen();
        route = MaterialPageRoute(builder: (_) => page);
        break;
      case orderTracking:
        page =  OrderTrackingScreen();
        route = MaterialPageRoute(builder: (_) => page);
        break;
      default:
        page = NotFoundScreen();
        route = slideUpRoute(page);
        break;
    }

    return route;
  }
}
