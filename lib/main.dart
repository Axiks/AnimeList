import 'package:anime_list_app/nav.dart';
import 'package:anime_list_app/screens/image_view_screen.dart';
import 'package:anime_list_app/screens/translate_anime_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(RouteWidget());
}

class RouteWidget extends StatelessWidget {
  // const RouteWidget({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => Nav(),
        '/anime':(BuildContext context) => AnimePageWidget(),
        '/list':(BuildContext context) => AnimeListWidget(),
        '/image':(BuildContext context) => ImageViewScreen(),
      },
      onUnknownRoute: (routeSetting) => _errorRoute(),
      onGenerateRoute: (routeSetting){
        var path = routeSetting.name!.split('/');

        if(path[1] == 'anime') {
          return new MaterialPageRoute(builder: (context) => new AnimePageWidget(),
          settings: routeSetting);
        }

        if(path[1] == 'translate') {
          return new MaterialPageRoute(builder: (context) => new TranslateAnimeInfoScreen(int.tryParse(path[2]) ?? 0),
              settings: routeSetting);
        }

        return _errorRoute();
      },
    );
  }
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
