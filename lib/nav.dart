import 'package:anime_list_app/screens/anime_add_screen.dart';
import 'package:anime_list_app/screens/gellery_screen.dart';
import 'package:anime_list_app/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Nav extends StatefulWidget{
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    // Center(child: Text('Activites')),
    AnimeAddScreen(),
    AnimeListWidget(),
    GalleryScreen(),
    UserScreen(),
  ];
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  _widgetOptions.elementAt(_currentIndex),
       bottomNavigationBar: BottomNavigationBar(
         fixedColor: Colors.blue,
         unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            //icon: Icon(Icons.pets),
              icon: Icon(Icons.scatter_plot),
              title: Text('Actives')
          ),
          BottomNavigationBarItem(
            //icon: Icon(Icons.compass_calibration_sharp),
              icon: Icon(Icons.explore_outlined),
              title: Text('Browse')
          ),
          BottomNavigationBarItem(
            //icon: Icon(Icons.compass_calibration_sharp),
              icon: Icon(Icons.crop_original),
              title: Text('Gallery')
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage('https://www.goha.ru/s/A:NX/Xj/utWvPIbVmY.jpg')
              ),
              //icon: Icon(Icons.circle),
              title: Text('Profile')
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

