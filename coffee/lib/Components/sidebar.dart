import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';

final colorPallete = ColorsSelection();
Widget SideBarItems(BuildContext context) {
  return Stack(
    children: [
      Positioned(
          top: 30,
          left: 20,
          child: Icon(
            Icons.menu_open_sharp,
            size: 30,
          )),
      Positioned(
          top: 75,
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              width: MediaQuery.of(context).size.height - 100,
              height: MediaQuery.of(context).size.width / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuItem("Black Gold", 0),
                  _buildMenuItem("Cold Brew", 1),
                  _buildMenuItem("Nescafe", 2),
                  _buildMenuItem("Gold Brew", 3),
                ],
              ),
            ),
          ))
    ],
  );
}

//Menu Items
Widget _buildMenuItem(String title, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      index ==1
          ? Container(
              height: 8.0,
              width: 8.0,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            )
          : Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
            ),
      SizedBox(height: 5,),
      GestureDetector(
        onTap: () {},
        child: Text(
          title,
          style: index == 1
              ? GoogleFonts.bigShouldersText(
                  color: colorPallete.textColor, fontSize: 20.0,fontWeight: FontWeight.bold)
              : GoogleFonts.bigShouldersText(
                  color: Colors.black, fontSize: 17.0),
        ),
      )
    ],
  );
}
