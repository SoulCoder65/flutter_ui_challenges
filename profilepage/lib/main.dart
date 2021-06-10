import 'package:flutter/material.dart';
import 'profile.dart';
void main()=>runApp(myApp());

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.black,

      ),
      title: "Profile UI",
      home: ProfileUI(),

    );
  }
}
