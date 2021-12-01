import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:travel_app/src/modules/home/dashboard_page.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _loading = false;
  _signIn(BuildContext context) async {
    bool isAuthenticated = await checkBiometric();

    if (isAuthenticated) {
      setState(() {
        _loading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (builder) => const DashboardPage(),
          ));
    } else {
      var snackBar = const SnackBar(
        content: Text('Error authenticating using Biometrics.'),
        duration: Duration(milliseconds: 2500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  bool isAuth = false;
  checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    List<BiometricType> availableBiometrics = [];
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biome trics $e");
    }
    print("biometric is available: $canCheckBiometrics");

    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }
    print("following biometrics are available");
    if (availableBiometrics.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $ab");
      });
    } else {
      print("no biometrics are available");
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Touch your finger on the sensor to login',
        useErrorDialogs: true,
        stickyAuth: false,
        biometricOnly: true,
      );
    } catch (e) {
      print("error using biometric auth: $e");
    }

    setState(() {
      isAuth = authenticated ? true : false;
    });

    print("authenticated: $authenticated");
    return authenticated;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: SvgPicture.asset(
                  AppImagens.circleOrange,
                  color: AppColors.orange,
                  width: size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 357, right: 260),
                child: SvgPicture.asset(
                  AppImagens.boatBack,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 355, left: 180),
                child: SvgPicture.asset(
                  AppImagens.boatFront,
                ),
              ),
              SvgPicture.asset(
                AppImagens.waterBack,
                fit: BoxFit.fitWidth,
                width: size.width,
              ),
              SvgPicture.asset(
                AppImagens.waterFront,
                fit: BoxFit.fitWidth,
                width: size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 250, left: 160),
                child: SvgPicture.asset(
                  AppImagens.treeCut,
                  alignment: Alignment.centerRight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 550, right: 240),
                child: SvgPicture.asset(
                  AppImagens.bird1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 510, right: 270),
                child: SvgPicture.asset(
                  AppImagens.bird2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 520, right: 190),
                child: SvgPicture.asset(
                  AppImagens.bird3,
                ),
              ),
              _loading
                  ? Container(
                      height: 350,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ElevatedButton(
                                  child: Container(
                                    width: 300,
                                    height: 60,
                                    child: const Center(
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => _signIn(context),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    elevation: 0,
                                    primary: AppColors.orange,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 100),
                                child: ElevatedButton(
                                  child: Container(
                                    width: 300,
                                    height: 60,
                                    child: const Center(
                                      child: Text(
                                        'Create an account',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    elevation: 0,
                                    primary: AppColors.darkGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Authentication {
  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: AndroidAuthMessages(signInTitle: 'Login Page'),
      );
    }
    print(isAuthenticated);

    return isAuthenticated;
  }
}
