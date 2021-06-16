import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import '../Components/sidebar.dart';
import '../Components/mainscreen.dart';
class CoffeeHouse extends StatefulWidget {
  @override
  _CoffeeHouseState createState() => _CoffeeHouseState();
}

class _CoffeeHouseState extends State<CoffeeHouse> {
  final colorPalette=ColorsSelection();
  @override
  Widget build(BuildContext context) {
    var ScreenHeight=MediaQuery.of(context).size.height;
    var ScreenWidth=MediaQuery.of(context).size.width;
    return Scaffold(

      body: Stack(
        children: [
          Container(
            height: ScreenHeight,
            width: ScreenWidth,
            color: Colors.transparent,
          ),
          //  Side bar
          Container(
            height: ScreenHeight,
            width: ScreenWidth/5,
            color: colorPalette.sideBar,
            child: SideBarItems(context),
          ),
          Positioned(
            left: ScreenWidth/5,
            child: Container(
              height: ScreenHeight,
              width: ScreenWidth-(ScreenWidth/5),
              color: Colors.white,
              child: MainScreen(context),
            ),
          )

        ],
      ),
    );
  }
}
