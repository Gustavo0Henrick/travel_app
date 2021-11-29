import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/src/modules/home/widgets/experiences_page.dart';
import 'package:travel_app/src/modules/home/widgets/tour_page.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';

import '../widgets/adventure_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int indexMenu = 0;
PageController pageController = PageController(initialPage: 0);
List homePages = [
  ExperiencesPage(),
  AdventurePage(),
  TourPage(),
];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    indexMenu = 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: size.width,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.orange),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.lightGrey,
                        size: 37,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Aloha',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'User',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 140),
                  SvgPicture.asset(AppImagens.menu),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Container(
              height: 125,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Live with no excuses and travel with no regrets - Oscar Wild',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexMenu = 0;
                                      pageController.animateToPage(0,
                                          duration: Duration(milliseconds: 150),
                                          curve: Curves.linear);
                                    });
                                  },
                                  child: Text(
                                    'Experiences',
                                    style: TextStyle(
                                      color: indexMenu == 0
                                          ? AppColors.orange
                                          : AppColors.lightGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  AppImagens.point,
                                  color: indexMenu == 0
                                      ? AppColors.orange
                                      : AppColors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 25,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexMenu = 1;
                                      pageController.animateToPage(1,
                                          duration: Duration(milliseconds: 150),
                                          curve: Curves.linear);
                                    });
                                  },
                                  child: Text(
                                    'Adventure',
                                    style: TextStyle(
                                      color: indexMenu == 1
                                          ? AppColors.orange
                                          : AppColors.lightGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  AppImagens.point,
                                  color: indexMenu == 1
                                      ? AppColors.orange
                                      : AppColors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 25,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexMenu = 2;
                                      pageController.animateToPage(2,
                                          duration: Duration(milliseconds: 150),
                                          curve: Curves.linear);
                                    });
                                  },
                                  child: Text(
                                    'Tour',
                                    style: TextStyle(
                                      color: indexMenu == 2
                                          ? AppColors.orange
                                          : AppColors.lightGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  AppImagens.point,
                                  color: indexMenu == 2
                                      ? AppColors.orange
                                      : AppColors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              child: PageView.builder(
                itemCount: 3,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: homePages[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
