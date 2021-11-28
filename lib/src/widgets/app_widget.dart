import 'package:flutter/material.dart';
import 'package:travel_app/src/modules/auth/auth_page.dart';
import 'package:travel_app/src/modules/home/dashboard_page.dart';
import 'package:travel_app/src/modules/onboarding/onboarding_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnBoardingPage(),
        '/auth': (context) => AuthPage(),
        '/home': (context) => DashboardPage(),
      },
    );
  }
}
