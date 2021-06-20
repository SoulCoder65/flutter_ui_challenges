import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Screens
import 'homescreen.dart';
import 'navigationscreen.dart';
//Constants
import '../Constants/colors.dart';

//services
import '../Services/statemanagement.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

final colorpallete = Colorpallete();

class _SplashScreenState extends State<SplashScreen> {
  Color bg_color = colorpallete.splash_bg_initial;
  String image = "icon_initial";
  Color title_color = colorpallete.splash_bg_final;
  double opacity = 1;
  double size = 50;
  double marginLeft=0.0;

  void getData()
  {

    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
    Provider.of<ManageState>(context,listen: false).getUsers();
  }
  @override
  void initState() {
    getData();

    Timer(Duration(seconds: 2), () {
      setState(() {
        bg_color = colorpallete.splash_bg_final;
        image = "icon_final";
        title_color = colorpallete.splash_bg_initial;
        opacity = 0.0;
        size = 100;
        marginLeft=50;
      });
    });
  Timer(Duration(seconds: 3), (){
    Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) {
      return NavigationScreen();
    },), (route) => false);
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;
    var ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedContainer(
        curve: Curves.linear,
        duration: Duration(seconds: 1),
        width: ScreenWidth,
        height: ScreenHeight,
        decoration: BoxDecoration(color: bg_color),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: size,
                margin: EdgeInsets.only(left: marginLeft),
                child: Image(
                  image: AssetImage("assets/images/${image}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: opacity,
                  child: Text(
                    "Tinder",
                    style: GoogleFonts.bigShouldersText(
                        color: title_color,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
