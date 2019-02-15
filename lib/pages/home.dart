import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{
  int _currentIndex = 0;
  static List<Color> _colors = [
    Colors.pink,
    Colors.brown,
    Colors.green[700],
    Colors.lightBlue[800],
    Colors.blueGrey[800]
  ];

  final List<Widget> _pages = [
    Center(
      child: Text("Home")
    ),
    Center(
      child: Text("Nofity")
    ),
    Center(
      child: Text("Map")
    ),
    Center(
      child: Text("Profile")
    ),
    Center(
      child: Text("Setup")
    )
  ];

  Color appBarColor = _colors[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Home", style: TextStyle(
          color: Colors.white
        ),
      ),
        backgroundColor: appBarColor,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home),
              backgroundColor: _colors[0]
            ),
            BottomNavigationBarItem(
              title: Text("Notify"),
              icon: Icon(Icons.notifications),
              backgroundColor: _colors[1]
            ),
            BottomNavigationBarItem(
              title: Text("Map"),
              icon: Icon(Icons.map),
              backgroundColor: _colors[2]
            ),
            BottomNavigationBarItem(
              title: Text("Profile"),
              icon: Icon(Icons.person),
              backgroundColor: _colors[3]
            ),
            BottomNavigationBarItem(
              title: Text("Setup"),
              icon: Icon(Icons.settings),
              backgroundColor: _colors[4]
            ),
          ],
          onTap: (int index){
            setState(() {
              _currentIndex = index;
              appBarColor = _colors[index];
            });
          },
        ),
      )
    );
  }

}