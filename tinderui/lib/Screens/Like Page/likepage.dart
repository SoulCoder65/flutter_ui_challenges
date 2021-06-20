import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:google_fonts/google_fonts.dart';
class Likes extends StatefulWidget {

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  CardController controller;
  //<--------------------Card-------------------->
  Widget _cardTemplated(
      double screenHeight,
      double screenWidth,
      bool show_nope,
      bool show_like,
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

                    ],
                  ),
                )),
            // show_nope ? _reject(screenWidth) : SizedBox(),
            // show_like ? _accept(screenWidth) : SizedBox()
          ],
        ));
  }
//<--------------------Card END-------------------->



  //Widget Card
  Widget _card(double screenHeight,double screenWidth,show_nope,show_like,int num)
  {
    return TinderSwapCard(
      totalNum: 2,
      animDuration: 300,
      swipeDown: true,
      swipeUp: true,
      orientation: AmassOrientation.LEFT,
      stackNum: 2,
      swipeEdge: 5,
      maxHeight: screenHeight * 0.8,
      maxWidth: screenWidth * 0.5,
      minHeight: screenHeight * 0.6,
      minWidth: screenWidth * 0.4,
      cardBuilder: (context, index) {
        return _cardTemplated(
            screenHeight,
            screenWidth,
            show_nope,
            show_like,
            "https://randomuser.me/api/portraits/women/${num}.jpg"

          );
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
        print("heki");
        // show_nope = false;
        // show_like = false;


        // print(index);
        // print(orientation);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    bool show_nope = false;
    bool show_like = false;
    return Scaffold(
      backgroundColor: Colors.black,
      body:GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (2 / 2),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,

        //physics:BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),

        children: [
          _card(screenHeight,screenWidth,show_nope,show_like,76),
          _card(screenHeight,screenWidth,show_nope,show_like,78),
          _card(screenHeight,screenWidth,show_nope,show_like,79),
          _card(screenHeight,screenWidth,show_nope,show_like,80),
          _card(screenHeight,screenWidth,show_nope,show_like,81),
        ],
      ) ,
    );
  }
}
