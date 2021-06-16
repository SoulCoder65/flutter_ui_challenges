import 'package:flutter/material.dart';

//Screens
import 'Screens/coffeehouse.dart';
void main()
{
  runApp(myApp());
}

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coffee House Design",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.white
      ),
      home: CoffeeHouse(),

    );
  }
}

