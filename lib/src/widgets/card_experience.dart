import 'package:flutter/material.dart';

class CardExperience extends StatelessWidget {
  String imagePath;
  CardExperience({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 400,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Image.asset(
        imagePath,
        width: 250,
        fit: BoxFit.fill,
      ),
    );
  }
}
