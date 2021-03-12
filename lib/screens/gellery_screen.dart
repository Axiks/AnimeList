import 'package:anime_list_app/models/data.dart';
import 'package:flutter/material.dart';

import '../models/anime.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({
    Key key,
    @required this.anime,
  }) : super(key: key);

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    List<Anime> allAnimeData = Data().getAnime();
    List<String> arts = List<String>();
    //arts.add(null);
    for (Anime anime in allAnimeData) {
      List<String> anime_arts_list = anime.arts;
      for (String art in anime_arts_list) {
        arts.add(art);
      }
    }

    return Scaffold(
      body:
        ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: arts.length ~/ 2,
          itemBuilder: (_, index) {
            int j = index + (index+1);
            int i = j - 1;

            return Container(
              child: InkWell(
                //onTap: () => Navigator.pushNamed(context, '/anime/${animes[index].malId}', arguments: animes[index]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            arts[i],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            arts[j],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),

      // ListView.builder(
      //   physics: BouncingScrollPhysics(),
      //   itemCount: arts.length,
      //   itemBuilder: (_, index) => Card(
      //     elevation: 0,
      //     //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //     child: InkWell(
      //       //onTap: () => Navigator.pushNamed(context, '/anime/${animes[index].malId}', arguments: animes[index]),
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Expanded(
      //             flex: 5,
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(10.0),
      //               child: Image.network(
      //                 arts[index],
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             flex: 5,
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(10.0),
      //               child: Image.network(
      //                 arts[index],
      //               ),
      //             ),                  ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
     );

    // return Scaffold(
    //   body: Container(
    //       child: SizedBox(
    //         child: ListView.builder(
    //             physics: BouncingScrollPhysics(),
    //             scrollDirection: Axis.vertical,
    //             itemCount: arts.length,
    //             itemBuilder: (_, index)=> Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 4.0,
    //                   vertical: 4.0
    //               ),
    //               child: Container(
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(15.0),
    //                   child: Image.network(
    //                       arts[index]
    //                   ),
    //                 ),
    //               ),
    //             )
    //         ),
    //       )
    //   ),
    // );
  }
}