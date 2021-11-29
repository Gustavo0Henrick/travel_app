import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';
import 'package:travel_app/src/widgets/card_adventure.dart';

class AdventurePage extends StatefulWidget {
  AdventurePage({Key? key}) : super(key: key);

  @override
  _AdventurePageState createState() => _AdventurePageState();
}

List listCards = [
  CardAdventure(title: 'River', imagePath: AppImagens.river),
  CardAdventure(title: 'Desert', imagePath: AppImagens.desert),
  CardAdventure(title: 'Camping', imagePath: AppImagens.mountain),
];

class _AdventurePageState extends State<AdventurePage> {
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
