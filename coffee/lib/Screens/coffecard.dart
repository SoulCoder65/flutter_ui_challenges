import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'detail.dart';

class CoffeCards extends StatefulWidget {
  @override
  _CoffeCardsState createState() => _CoffeCardsState();
}

class _CoffeCardsState extends State<CoffeCards> {
  Widget CardWidget(String img, String title, int price, String review,
      Color color, double rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(
          builder: (context) {
            return DetailScreen();
          },
        ));
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.transparent),
          ),
          Positioned(
              top: 100,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/doodle.png"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 100,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white.withOpacity(0.6)),
              )),
          Positioned(
              top: 100,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: color.withOpacity(0.8)),
              )),
          Positioned(
              right: 120,
              child: Hero(
                tag: "tag1",
                child: Container(
                  width: 150,
                  height: 200,
                  child: Image(
                    image: AssetImage("assets/images/${img}"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )),
          Positioned(
              top: 120,
              left: 20,
              child: Text(
                "Price",
                style: GoogleFonts.bigShouldersText(
                    color: colorPallete.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
          Positioned(
              top: 160,
              left: 10,
              child: Text(
                " \$${price}",
                style: GoogleFonts.bigShouldersText(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              )),
          Positioned(
              top: 220,
              left: 20,
              child: Text(
                title,
                style: GoogleFonts.bigShouldersText(
                    color: colorPallete.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
          Positioned(
              top: 250,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "$review review",
                        style: GoogleFonts.bigShouldersText(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      RatingBar.builder(
                        initialRating: rating,
                        itemSize: 10,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 5,
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            color: colorPallete.textColor,
                          ),
                          Text(
                            "Add",
                            style: GoogleFonts.bigShouldersText(
                                color: colorPallete.textColor),
                          )
                        ],
                      ))
                ],
              )),
        ],
      ),
    );
  }

  final colorPallete = ColorsSelection();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardWidget("coffee1.png", "Grady's COLD BREW", 150, "65",
            colorPallete.firstCardBg, 4),
        CardWidget("coffee2.png", "Grady's COLD BREW", 200, "65",
            colorPallete.secondCardBg, 2.5),
      ],
    );
  }
}
