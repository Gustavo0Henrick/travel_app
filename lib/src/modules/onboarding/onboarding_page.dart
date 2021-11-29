import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/src/modules/auth/auth_page.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: size.height * 0.32,
                width: size.width,
                child: SvgPicture.asset(
                  AppImagens.orangeDraw,
                  height: size.height * 0.3,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: size.height * 0.2,
                  width: size.width,
                  child: SvgPicture.asset(
                    AppImagens.whiteLine,
                    fit: BoxFit.fill,
                    width: size.width,
                    height: size.height * 0.3,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: SvgPicture.asset(
                    AppImagens.plant,
                    width: size.width,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40, left: 200),
                  child: GestureDetector(
                    child: const Text(
                      'Get Start',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (builder) => const AuthPage(),
                          ));
                    },
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
