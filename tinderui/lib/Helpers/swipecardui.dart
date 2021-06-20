import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tinderui/Services/statemanagement.dart';

loadMoreProfiles(BuildContext context) {
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
  Provider.of<ManageState>(context, listen: false).getUsers();
}

//<-------------------Show Reject------------------->
Widget _reject(double screenWidth) {
  return Positioned(
      top: 12,
      right: 10,
      child: Container(
        width: screenWidth * 0.3,
        child: RotationTransition(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shadowColor: Colors.white.withOpacity(0.7),
                elevation: 2,
                side: BorderSide(width: 2, color: Colors.red)),
            onPressed: () {},
            child: Text(
              "NOPE",
              style: GoogleFonts.abel(
                  color: Colors.red,
                  decorationThickness: 10,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          turns: AlwaysStoppedAnimation(15 / 360),
        ),
      ));
}

//<-------------------Show Reject END------------------->
//<-------------------Show Accept------------------->
Widget _accept(double screenWidth) {
  return Positioned(
      top: 17,
      left: 10,
      child: Container(
        width: screenWidth * 0.3,
        child: RotationTransition(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shadowColor: Colors.white.withOpacity(0.7),
                elevation: 2,
                side: BorderSide(width: 2, color: Colors.green)),
            onPressed: () {},
            child: Text(
              "LIKE",
              style: GoogleFonts.abel(
                  color: Colors.green,
                  decorationThickness: 10,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          turns: AlwaysStoppedAnimation(340 / 360),
        ),
      ));
}
//<-------------------Show Accept END------------------->

//<--------------------Card-------------------->
Widget _card(
    int currentIndex,
    int index,
    double screenHeight,
    double screenWidth,
    bool show_nope,
    bool show_like,
    String fullname,
    String location,
    String email,
    String profile) {
  return Card(
      child: Stack(
    fit: StackFit.expand,
    children: [
      Image.network(
        profile,
        fit: BoxFit.cover,
      ),
      Positioned(
          top: screenHeight - screenHeight * 0.55,
          child: Container(
            height: screenHeight * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      fullname,
                      style: GoogleFonts.abel(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " 22",
                      style:
                          GoogleFonts.abel(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.abel(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.not_listed_location,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.abel(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          )),
      (show_nope&&(index==currentIndex)) ? _reject(screenWidth) : SizedBox(),
      (show_like&&(index==currentIndex)) ? _accept(screenWidth) : SizedBox()
    ],
  ));
}
//<--------------------Card END-------------------->

Widget cardUI(BuildContext context) {
  int currentIndex=0;
  List<Map<String, dynamic>> profiles =
      Provider.of<ManageState>(context, listen: false).allprofiles;

  // print(profiles[0]);
  CardController controller;
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;
  bool show_nope = false;
  bool show_like = false;
  return Center(
    child: Container(
      height: screenHeight * 0.6,
      child:!Provider.of<ManageState>(context,listen: false).errorStatus? TinderSwapCard(
              totalNum: profiles.length,
              animDuration: 300,
              swipeDown: true,
              swipeUp: true,
              orientation: AmassOrientation.BOTTOM,
              stackNum: 3,
              swipeEdge: 5,
              maxHeight: screenHeight * 0.9,
              maxWidth: screenWidth * 0.9,
              minHeight: screenHeight * 0.7,
              minWidth: screenWidth * 0.8,
              cardBuilder: (context, index) {
                return _card(
                    currentIndex,
                    index,
                    screenHeight,
                    screenWidth,
                    show_nope,
                    show_like,
                    "${profiles[index]['name']['first']} ${profiles[index]['name']['last']}",
                    "${profiles[index]['location']['city']}, ${profiles[index]['location']['state']}, ${profiles[index]['location']['country']}",
                    profiles[index]['email'],
                    profiles[index]['picture']['large']);
              },
              cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                if (align.x >= 0 && align.x <= 1) {
                  show_nope = false;
                  show_like = false;
                }
                if (align.x < -1) {
                  show_nope = true;
                  show_like = false;
                } else if (align.x >= 4) {
                  show_nope = false;
                  show_like = true;
                } else {
                  show_nope = false;
                  show_like = false;
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                    currentIndex=index+1;
                show_nope = false;
                show_like = false;

                if (index == profiles.length-1 ) {
                  Provider.of<ManageState>(context,listen: false).clearList();
                  loadMoreProfiles(context);
                }
                // print(index);
                // print(orientation);
              },
            ):Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Something Went Wrong\nTry Again Later",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.loop,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    loadMoreProfiles(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),

    ),
  );
}

//
