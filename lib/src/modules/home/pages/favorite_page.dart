import 'package:flutter/material.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';
import 'package:travel_app/src/widgets/card_tour.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List listFavorites = [
      CardTour(
        title: 'New York',
        subtitle: 'United States of America',
        imagePath: AppImagens.newYork,
      ),
      CardTour(
        title: 'Sydney',
        subtitle: 'Australia',
        imagePath: AppImagens.sydney,
      ),
      CardTour(
        title: 'Paris',
        subtitle: 'France',
        imagePath: AppImagens.paris,
      ),
    ];
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Favorite",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listFavorites.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 10, top: 50),
                      child: listFavorites[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
