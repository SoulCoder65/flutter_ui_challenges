import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final colorPallete = ColorsSelection();
  @override
  Widget build(BuildContext context) {
    var ScreenHeight = MediaQuery.of(context).size.height;
    var ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: ScreenWidth,
            height: ScreenHeight,
            decoration: BoxDecoration(color: colorPallete.secondbg),
          ),
          Positioned(
              child: Container(
            width: ScreenWidth,
            height: ScreenHeight / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                color: Colors.white),
          )),
          Positioned(
              top: 40,
              child: Container(
                width: ScreenWidth,
                height: ScreenHeight / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/doodle.png"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              child: Container(
            width: ScreenWidth,
            height: ScreenHeight / 3.4,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
          )),
          Positioned(
              child: Container(
            width: ScreenWidth,
            height: ScreenHeight / 2.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: colorPallete.secondCardBg.withOpacity(0.9)),
          )),
          Positioned(
              top: 40,
              left: 20,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              )),
          Positioned(
              top: 40,
              right: 10,
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              )),
          Positioned(
              top: ScreenHeight - ScreenHeight / 1.26,
              left: ScreenWidth / 5,
              child: Container(
                width: 230,
                height: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/coffee2.png"))),
              )),
          Positioned(
              top: ScreenHeight - ScreenHeight / 2.2,
              left: ScreenWidth / 4,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Grady's COLD BREW",
                      style: GoogleFonts.bigShouldersText(
                          color: colorPallete.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: ScreenWidth / 1.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_outlined,
                                color: colorPallete.textColor,
                                size: 27,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "1.5K",
                                style: GoogleFonts.bigShouldersText(
                                    color: colorPallete.secondCardBg,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: colorPallete.textColor,
                                size: 27,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "4.0",
                                style: GoogleFonts.bigShouldersText(
                                    color: colorPallete.secondCardBg,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.wine_bar_outlined,
                                color: colorPallete.textColor,
                                size: 27,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "No. 1",
                                style: GoogleFonts.bigShouldersText(
                                    color: colorPallete.secondCardBg,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              top: ScreenHeight - ScreenHeight / 3.2,
              left: 20,
              child: Container(
                width: ScreenWidth - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Us",
                      style: GoogleFonts.bigShouldersText(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: colorPallete.textColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Since dark roast is the perfect choice for cold brew, it is no doubt that Café Du Monde wins the top place. Farmer's Market Jo's coffee ground has the light-medium roast. If you're into floral notes in the coffee, then you'd prefer this product.",
                      style: GoogleFonts.bigShouldersText(
                        color: Colors.grey,
                      ),
                      maxLines: 4,
                    )
                  ],
                ),
              )),
          Positioned(
            width: ScreenWidth-50,
              top: ScreenHeight - ScreenHeight / 8,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange.shade400),
                    child: Align(
                        child: Text(
                      "BUY NOW",
                      style: GoogleFonts.bigShouldersText(
                          color: colorPallete.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange,width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.bookmark_border_outlined),
                  )
                   ],
              ))
        ],
      ),
    );
  }
}
