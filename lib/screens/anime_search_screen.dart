import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/screens/anime_list_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class AnimeSearchScreen extends StatelessWidget{
  get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildFloatingSearchBar(context),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // AnimeSearch anime = AnimeSearch("toradora");
    // context.read<AnimeBlock>().add(anime);

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        //print("Запит: " + query.toString());
        AnimeSearch anime = AnimeSearch(query);
        context.read<AnimeBlock>().add(anime);
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.camera_alt_rounded),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        print("Bulder onn");
        return AnimeSearchBar();
        //return Text("Builder\n" + transition.toString());
        // return BlocBuilder<AnimeBlock, AnimeState>(
        //     builder: (context, state) {
        //       if(state is AnimeInitial){
        //         return Text("Initinal...");
        //       }else if(state is AnimeSuccessFalse){
        //         return Text("Помилка отримання даних");
        //       }else if(state is AnimeSuccessTrue){
        //         AnimeSuccessTrue as = state;
        //         List<Anime> animes = as.anime;
        //         return Text("Все ОК!");
        //       }else{
        //         return Center(
        //             child: Text("Какая то лєва подія: " + state.toString())
        //         );
        //       }
        //     }
        // );
        // return ClipRRect(
        //   borderRadius: BorderRadius.circular(8),
        //   child: Material(
        //     color: Colors.white,
        //     elevation: 4.0,
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: Colors.accents.map((color) {
        //         return Container(height: 112, color: color);
        //       }).toList(),
        //     ),
        //   ),
        // );
      },
      // body: BlocBuilder<AnimeBlock, AnimeState>(
      //     builder: (context, state) {
      //       if(state is AnimeInitial){
      //         return Center(
      //             child: Text("Initinal...")
      //         );
      //       }else if(state is AnimeSuccessFalse){
      //         return Text("Помилка отримання даних");
      //       }else if(state is AnimeSuccessTrue){
      //         AnimeSuccessTrue as = state;
      //         List<Anime> animes = as.anime;
      //         return AnimesListWidget(animes);
      //       }else{
      //         return Center(
      //             child: Text("Какая то лєва подія: " + state.toString())
      //         );
      //       }
      //     }
      // ),
    );
  }
}

class AnimeSearchBar extends StatefulWidget{
  @override
  _AnimeSearchBarState createState() => _AnimeSearchBarState();
}

class _AnimeSearchBarState extends State<AnimeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBlock, AnimeState>(
        builder: (context, state) {
          print("Change state");
          if(state is AnimeInitial){
            return Text("Initinal...");
          }else if(state is AnimeSuccessFalse){
            return Text("Помилка отримання даних");
          }else if(state is AnimeSuccessTrue){
            AnimeSuccessTrue as = state;
            List<Anime> animes = as.anime;
            //return Text(animes.toString());
            //return AnimesListWidget(animes);
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4.0,
                // child: Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: Colors.accents.map((color) {
                //     return Container(
                //         height: 112,
                //         color: color,
                //       child: Text(),
                //     );
                //   }).toList(),
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for(var anime in animes ) Container(
                      // height: 112,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, '/anime/${anime.malId}', arguments: anime),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  imageUrl: anime.mainPicture,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
                                  )),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                )
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                            anime.alternativeTitles['ua']?.first.toString() ?? anime.title,
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
                                              anime.alternativeTitles['en']?.first.toString() ?? "",
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
                                            anime.synopsis,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                              fontFamily: 'Roboto',
                                              color: new Color(0xFF212121),
                                            ),
                                          )
                                      ),
                                    ]
                                )
                              ),
                            ),
                            ],
                          ),
                        ),
                      )
                    )
                  ],
                )
              ),
            );
          }else{
            return Center(
                child: Text("Какая то лєва подія: " + state.toString())
            );
          }
        }
    );
  }
}