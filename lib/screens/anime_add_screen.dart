import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/repository/anime_repository.dart';
import 'package:anime_list_app/screens/anime_list_widget.dart';
import 'package:anime_list_app/screens/anime_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeAddScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //List<Anime> animes = AnimeRepository().animeSearch("Toradora");
    // TODO: implement build
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => AnimeBlock(AnimeInitial()),
        child: Container(
          //child: CountAnimesWidget(),
          child: AnimeSearchScreen(),
        ),
      ),
    );
  }
}

class CountAnimesWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AnimeSearch anime = AnimeSearch("Toradora");
    //AnimeGetAll anime = AnimeGetAll();
    //AnimeGet anime = AnimeGet(1);
    context.read<AnimeBlock>().add(anime);

    return BlocBuilder<AnimeBlock, AnimeState>(
        builder: (context, state) {
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
    );
  }

}