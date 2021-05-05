import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/screens/anime_list_widget.dart';
import 'package:anime_list_app/screens/anime_draggable_page_screen.dart';
import 'package:anime_list_app/screens/anime_page_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/anime.dart';
import 'models/data.dart';

class AnimeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Neko List App ;3"),
        centerTitle: true,
        backgroundColor: Colors.black87, // status bar color
        brightness: Brightness.light, // status
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
        body: BlocProvider<AnimeBlock>(
          create: (BuildContext context) => AnimeBlock(AnimeInitial()),
            child: BlocBuilder<AnimeBlock, AnimeState>(
                builder: (context, state) {
                  AnimeGetAll animeAll = AnimeGetAll();
                  context.read<AnimeBlock>().add(animeAll);
                  if(state is AnimeInitial){
                    return Center(
                        child: Text("Initinal...")
                    );
                  }else if(state is AnimeSuccessFalse){
                    return Text("Помилка отримання даних");
                  }else if(state is AnimeSuccessTrue){
                    AnimeSuccessTrue as = state;
                    List<Anime> animes = as.anime;
                    return AnimesListWidget(animes);
                  }else{
                    return Center(
                        child: Text("Какая то лєва подія: " + state.toString())
                    );
                  }
                }
            )
        )
        //AnimesListWidget(animes),
        );
  }
}

// class AnimesWidget extends StatelessWidget {
//   final List<Anime> animes;
//   const AnimesWidget(this.animes, {Key? key}): super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: BouncingScrollPhysics(),
//       itemCount: animes.length,
//       itemBuilder: (_, index) => Card(
//           elevation: 0,
//           //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: InkWell(
//             onTap: () => Navigator.pushNamed(context, '/anime/${animes[index].malId}', arguments: animes[index]),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   flex: 3,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: CachedNetworkImage(
//                       imageUrl: animes[index].mainPicture,
//                       placeholder: (context, url) => Center(child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
//                       )),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 7, // 60%
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                             child: Text(
//                               animes[index].alternativeTitles['ua'],
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: new TextStyle(
//                                 fontSize: 14.0,
//                                 fontFamily: 'Roboto',
//                                 color: new Color(0xFF212121),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             )
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Container(
//                             child: Text(
//                               animes[index].alternativeTitles['en'],
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: new TextStyle(
//                                 fontSize: 11.0,
//                                 fontFamily: 'Roboto',
//                                 color: new Color(0xFF7C7C7C),
//                               ),
//                             )
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Container(
//                             child: Text(
//                               animes[index].synopsis,
//                               maxLines: 4,
//                               overflow: TextOverflow.ellipsis,
//                               style: new TextStyle(
//                                 fontSize: 13.0,
//                                 fontFamily: 'Roboto',
//                                 color: new Color(0xFF212121),
//                               ),
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }

class AnimePageWidget extends StatelessWidget{
  // final String _id;
  // const AnimePageWidget(this._id, {Key? key}): super(key: key);



  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;
    return AnimePageScreen(anime);
  }

}

class AnimeDraggableScrollable extends StatelessWidget{
  final String _id;

  const AnimeDraggableScrollable(this._id, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;
    return MaterialApp(
        //color: Colors.grey,
        title: "Anime info",
        home: AnimeDraggableScrollableScreen(anime)
    );
  }
  Widget cardsWidget(itemIndex)=> Container(

  );
}
