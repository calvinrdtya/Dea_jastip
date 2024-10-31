import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/core/routes/app_routes.dart';
import 'app/core/providers/auth_provider.dart';
import 'app/features/profile/providers/driver_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProxyProvider<AuthProvider, DriverProvider>(
          create: (context) =>
              DriverProvider(Provider.of<AuthProvider>(context, listen: false)),
          update: (context, authProvider, driverProvider) =>
              DriverProvider(authProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Justip',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    ); 
  }
}
