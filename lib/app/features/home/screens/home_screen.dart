import 'package:flutter/material.dart';
import '../widgets/drivers/driver_post_list.dart';
import '../widgets/users/user_post_list.dart';
import '../widgets/home_app_bar.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../widgets/home_floating_button.dart';
import 'package:provider/provider.dart';
import 'package:justipin/app/core/providers/auth_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

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

    // Debug print statements
    print('User Name: $userName');
    print('User Role: $userRole');
    print('Token: ${authProvider.token}');
    print('Is Logged In: ${authProvider.isLoggedIn}');
    print('User: ${authProvider.user}');
    print('Driver: ${authProvider.driver}');
    print('User Detail: ${authProvider.userDetail}');

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                buildAppBar(context, userName),
              ];
            },
            body: TabBarView(
              children: [
                DriverPostList(userRole: userRole), // Pass userRole
                UserPostList(userRole: userRole), // Pass userRole
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingActionButton(),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ));
  }
}
