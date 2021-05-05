import 'package:anime_list_app/models/art.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/anime.dart';

class GalleryScreen extends StatelessWidget {
  // final Anime anime;
  // const GalleryScreen(this.anime, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Anime> allAnimeData = Data().getAnime();
    List<Art> arts = [];
    for (Anime anime in allAnimeData) {
      List<String> anime_arts_list = anime.arts;
      int i = 0;
      while(i < anime_arts_list.length) {
        arts.add(Art(
          index: i,
          href: anime_arts_list[i],
          anime: anime
        ));
        i++;
      }
      // for (String art in anime_arts_list) {
      //   arts.add(art);
      // }
    }

    return Scaffold(
      body: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 4,
        itemCount: arts.length,
        itemBuilder: (BuildContext context, int index) =>
            Card(
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, '/image', arguments: arts[index]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: CachedNetworkImage(
                                  imageUrl: arts[index].href,
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
                                    )),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 4 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );

    // return Scaffold(
    //   body:
    //     ListView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: arts.length ~/ 2,
    //       itemBuilder: (_, index) {
    //         int j = index + (index+1);
    //         int i = j - 1;
    //
    //         return Container(
    //           child: InkWell(
    //             //onTap: () => Navigator.pushNamed(context, '/anime/${animes[index].malId}', arguments: animes[index]),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Expanded(
    //                   flex: 5,
    //                   child: Card(
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       child: CachedNetworkImage(
    //                         imageUrl: arts[i],
    //                         placeholder: (context, url) => Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Center(child: CircularProgressIndicator(
    //                             valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
    //                           )),
    //                         ),
    //                         errorWidget: (context, url, error) => Icon(Icons.error),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Expanded(
    //                   flex: 5,
    //                   child: Card(
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       child: CachedNetworkImage(
    //                         imageUrl: arts[j],
    //                         placeholder: (context, url) => Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Center(child: CircularProgressIndicator(
    //                               valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
    //                           )),
    //                         ),
    //                         errorWidget: (context, url, error) => Icon(Icons.error),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       }
    //     ),
    //
    //   // ListView.builder(
    //   //   physics: BouncingScrollPhysics(),
    //   //   itemCount: arts.length,
    //   //   itemBuilder: (_, index) => Card(
    //   //     elevation: 0,
    //   //     //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //   //     child: InkWell(
    //   //       //onTap: () => Navigator.pushNamed(context, '/anime/${animes[index].malId}', arguments: animes[index]),
    //   //       child: Row(
    //   //         crossAxisAlignment: CrossAxisAlignment.start,
    //   //         children: <Widget>[
    //   //           Expanded(
    //   //             flex: 5,
    //   //             child: ClipRRect(
    //   //               borderRadius: BorderRadius.circular(10.0),
    //   //               child: Image.network(
    //   //                 arts[index],
    //   //               ),
    //   //             ),
    //   //           ),
    //   //           Expanded(
    //   //             flex: 5,
    //   //             child: ClipRRect(
    //   //               borderRadius: BorderRadius.circular(10.0),
    //   //               child: Image.network(
    //   //                 arts[index],
    //   //               ),
    //   //             ),                  ),
    //   //         ],
    //   //       ),
    //   //     ),
    //   //   ),
    //   // ),
    //  );

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
