import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/src/modules/home/dashboard_page.dart';
import 'package:travel_app/src/themes/app_colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

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
                  'assets/images/svg/circle_orange.svg',
                  color: AppColors.orange,
                  width: size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 357, right: 260),
                child: SvgPicture.asset(
                  'assets/images/svg/boat_back.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 355, left: 180),
                child: SvgPicture.asset(
                  'assets/images/svg/boat_front.svg',
                ),
              ),
              SvgPicture.asset(
                'assets/images/svg/water_back.svg',
                fit: BoxFit.fitWidth,
                width: size.width,
              ),
              SvgPicture.asset(
                'assets/images/svg/water_front.svg',
                fit: BoxFit.fitWidth,
                width: size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 250, left: 160),
                child: SvgPicture.asset(
                  'assets/images/svg/tree_cut.svg',
                  alignment: Alignment.centerRight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 550, right: 240),
                child: SvgPicture.asset(
                  'assets/images/svg/bird_1.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 510, right: 270),
                child: SvgPicture.asset(
                  'assets/images/svg/bird_2.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 520, right: 190),
                child: SvgPicture.asset(
                  'assets/images/svg/bird_3.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 180),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (builder) => const DashboardPage(),
                        ));
                  },
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
    );
  }
}
