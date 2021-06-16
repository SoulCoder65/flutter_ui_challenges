import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';
import '../Screens/coffecard.dart';
final colorPallete = ColorsSelection();

Widget _title() {
  return Positioned(
      top: 70,
      left: 20,
      child: Text(
        "CoffeeHouse",
        style: GoogleFonts.bigShouldersText(
            fontSize: 40,
            color: colorPallete.textColor,
            fontWeight: FontWeight.bold),
      ));
}

Widget _subtitle() {
  return Positioned(
      top: 120,
      left: 35,
      child: Text(
        "A lot can happen over coffee",
        style: GoogleFonts.bigShouldersText(
          color: Colors.grey,
          fontSize: 16,
        ),
      ));
}

Widget _textField() {
  return Positioned(
      top: 160,
      left: 20,
      child: Container(
        width: 250,
        height: 50,
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(13),
              hintText: "Search....",
              suffixIcon: Icon(Icons.search)),
        ),
      ));
}


Widget MainScreen(BuildContext context) {
  var ScreenHeight = MediaQuery.of(context).size.height;
  var ScreenWidth = MediaQuery.of(context).size.width;

  return Stack(
    children: [
      Positioned(right: 10, top: 25, child: Icon(Icons.shopping_bag)),
      _title(),
      _subtitle(),
      _textField(),
      Positioned(
          top: ScreenHeight/5,
          left: 20,
          child: Container(
              width:ScreenWidth,
              height: ScreenHeight,
              child: CoffeCards()))
    ],
  );
}
