import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinderui/Services/statemanagement.dart';
import '../Constants/colors.dart';
import 'package:provider/provider.dart';
//Services
import '../Services/fetchdata.dart';
//Screens
import '../Helpers/swipecardui.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final colorpallete = Colorpallete();

  //<-------------------Appbar------------------>
  Widget appBar() {
    return new AppBar(
      leadingWidth: 30,
      toolbarHeight: 30,
      titleSpacing: 4,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        "tinder",
        style: GoogleFonts.aBeeZee(
            color: colorpallete.splash_bg_initial,
            fontWeight: FontWeight.bold,
            fontSize: 26),
      ),
      leading: Container(
        margin: EdgeInsets.only(
          left: 10,
          top: 2,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/icon_final.png"),
              fit: BoxFit.cover),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shield),
          onPressed: () {},
        )
      ],
    );
  }
  //<-------------------Appbar END------------------>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorpallete.home_screen_bg,
      appBar: appBar(),
      body: Consumer<ManageState>(
        builder: (context, value, child) {
          return cardUI(context);
        },
      ),
    );
  }
}
