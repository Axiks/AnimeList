import 'package:anime_list_app/screens/anime_draggable_page_screen.dart';
import 'package:anime_list_app/screens/anime_page_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'models/anime.dart';
import 'models/data.dart';

class AnimeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Anime> animes = Data().getAnime();
    return  Scaffold(
      appBar: AppBar(
        title: Text("Neko List App :3"),
        centerTitle: true,
        backgroundColor: Colors.black87, // status bar color
        brightness: Brightness.light, // status
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: animes.length,
          itemBuilder: (_, index) => Card(
              elevation: 0,
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/anime/${animes[index].malId}', arguments: animes[index]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl: animes[index].mainPicture,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
                          )),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7, // 60%
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text(
                                  animes[index].alternativeTitles['ua'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                                child: Text(
                                  animes[index].alternativeTitles['en'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: 11.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF7C7C7C),
                                  ),
                                )
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                                child: Text(
                                  animes[index].synopsis,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: 13.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}

class AnimePageWidget extends StatelessWidget{
  String _id;
  AnimePageWidget({String id}):_id = id;

  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context).settings.arguments;
    return AnimePageScreen(anime: anime);
  }

}

class AnimeDraggableScrollable extends StatelessWidget{
  String _id;
  AnimeDraggableScrollable({String id}):_id = id;

  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
        //color: Colors.grey,
        title: "Anime info",
        home: AnimeDraggableScrollableScreen(anime: anime)
    );
  }
  Widget cardsWidget(itemIndex)=> Container(

  );
}

class DataSearch extends SearchDelegate<String>{

  
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  
}