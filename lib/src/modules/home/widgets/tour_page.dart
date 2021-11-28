import 'package:flutter/material.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/widgets/card_tour.dart';

class TourPage extends StatefulWidget {
  TourPage({Key? key}) : super(key: key);

  @override
  _TourPageState createState() => _TourPageState();
}

List listCards = [
  CardTour(
      title: 'Paris',
      subtitle: 'France',
      imagePath: 'assets/images/png/paris.png'),
  CardTour(
      title: 'Amazon',
      subtitle: 'Brazil',
      imagePath: 'assets/images/png/forest.png'),
  CardTour(
      title: 'Fuji',
      subtitle: 'Japan',
      imagePath: 'assets/images/png/fuji.png'),
];

class _TourPageState extends State<TourPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height,
        width: size.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: listCards.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                child: listCards[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
