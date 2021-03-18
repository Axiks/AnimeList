import 'package:anime_list_app/nav.dart';
import 'package:anime_list_app/screens/image_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => Nav(),
      '/anime':(BuildContext context) => AnimePageWidget(),
      '/list':(BuildContext context) => AnimeListWidget(),
      '/image':(BuildContext context) => ImageViewScreen(),
    },
    onUnknownRoute: (routeSetting) => _errorRoute(),
    onGenerateRoute: (routeSetting){
      var path = routeSetting.name.split('/');

      if(path[1] == 'anime') {
        return new MaterialPageRoute(builder: (context) => new AnimePageWidget(id:path[2]),
        settings: routeSetting);
      }

      // if(path[1] == 'image') {
      //   if(path[2] != null && path[3] != null){
      //     return new MaterialPageRoute(builder: (context) => new AnimePageWidget(id:path[2] + '/' + path[3]),
      //         settings: routeSetting);
      //   }
      // }

      return _errorRoute();
    },
  ));
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}
