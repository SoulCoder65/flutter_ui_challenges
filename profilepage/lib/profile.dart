import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatefulWidget {
  // const ProfileUI({Key? key}) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

Widget _clipArc(BuildContext context) {
  return ClipPath(
    clipper: Clipper(),
    child: Container(
      height: MediaQuery.of(context).size.height,
      child: Image(
        image: AssetImage("assets/bg.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

class Clipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
}

Widget _profilepic(BuildContext context) {
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 10.0, spreadRadius: 5)
        ],
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/id/1005/200/300"),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(75))),
  );
}

Widget _title() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Text(
      "Akshay Saxena",
      style: TextStyle(fontFamily: "Source Sans Pro", fontSize: 30),
    ),
  );
}

Widget _subtitle() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    child: Text(
      "Software Engineer",
      style: TextStyle(fontFamily: "Stint Ultra Condensed", fontSize: 18),
    ),
  );
}

Widget _tags(tag_title) {
  return Container(
    padding: EdgeInsets.only(top: 8),
    height: 30,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.grey.shade400,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.6,
            spreadRadius: 0.4,
          )
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20))),
    child: Text(
      tag_title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: "Stint Ultra Condensed",
          fontSize: 14,
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget _hireBtn() {
  return ElevatedButton(
    
    style: ElevatedButton.styleFrom(
      primary: Colors.black,
      padding: EdgeInsets.only(left: 30,right: 30)
    ),
      onPressed: () {},
      child: Text(
        "Hire",
        style: TextStyle(fontFamily: "Source Sans Pro", fontSize: 20),
      ));
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _clipArc(context),
          Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  _profilepic(context),
                  _title(),
                  _subtitle(),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _tags("MERN"),
                      SizedBox(
                        width: 15,
                      ),
                      _tags("Flutter"),
                      SizedBox(
                        width: 15,
                      ),
                      _tags("Python")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _tags("Java"),
                      SizedBox(
                        width: 15,
                      ),
                      _tags("JS")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _hireBtn(),
                ],
              ))
        ],
      ),
    );
  }
}
