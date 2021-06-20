import 'package:flutter/material.dart';
import 'likepage.dart';
import '../../Screens/not_develop.dart';
class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 65, 65, 65),
          bottom: TabBar(
            tabs: [
              Tab(text: "5 likes"),
              Tab(
                text: "Top Picks",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Likes(), NotDeveloped()],
        ),
      ),
    );
  }
}
