import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/src/modules/home/pages/favorite_page.dart';
import 'package:travel_app/src/modules/home/pages/home_page.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

int indexPage = 0;

List pages = [
  HomePage(),
  Container(),
  FavoritePage(),
];

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    indexPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: pages[indexPage],
      ),
      bottomNavigationBar: Container(
        height: 120,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  indexPage = 0;
                });
              },
              child: SvgPicture.asset(
                indexPage == 0 ? AppImagens.homeSelected : AppImagens.home,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  indexPage = 1;
                });
              },
              child: SvgPicture.asset(
                indexPage == 1 ? AppImagens.searchSelected : AppImagens.search,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  indexPage = 2;
                });
              },
              child: SvgPicture.asset(
                indexPage == 2
                    ? AppImagens.favoriteSelected
                    : AppImagens.favorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
