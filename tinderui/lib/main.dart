import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinderui/Services/statemanagement.dart';
import 'package:flutter/services.dart' ;

//Screens
import 'Screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ManageState())],
      builder: (context, child) {
        return new MaterialApp(
          title: "Tinder Clone",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.pinkAccent,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
