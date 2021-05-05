import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/block/anime_favorite_check.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget{
  User adrian = Data().getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AnimeBlock>(
            create: (BuildContext context) => AnimeBlock(AnimeInitial()),
          ),
          BlocProvider<AnimeFavoriteCheck>(
            create: (BuildContext context) => AnimeFavoriteCheck(false),
          ),
        ],
        child:  SingleChildScrollView(
            child: Column(
              children:  <Widget>[
                Container(child: ProfileWidget(adrian)),
                Container(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Container(
                  child: Text(
                    "Favorite Anime",
                    style: new TextStyle(
                        fontSize: 21.0
                    ),
                  ),
                ),
                AnimesWidget(adrian.favoriteAnime)
              ],
            )
        )
      ),
    );
  }

}

class ProfileWidget extends StatelessWidget {
  final User adrian;

  const ProfileWidget(this.adrian, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 64.0,
                horizontal: 8.0
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: adrian.coverPicture,
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Positioned(
                child: Container(
                  child: CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(adrian.mainPicture)
                  ),
                ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            adrian.name,
            style: new TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
    //return AnimesWidget(animes: animes);
  }
}

class AnimesWidget extends StatelessWidget {
  final List<Anime> animes;
  const AnimesWidget(this.animes, {Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBlock, AnimeState>(
    builder: (context, state) {
      if(state is AnimeInitial){
        return Center(
            child: Text("Loading")
        );
      }else if(state is AnimeSuccessFalse){
        return Text("Помилка отримання даних");
      }else if(state is AnimeSuccessTrue){
        return Text("Success");
      }else{
        return Center(
            child: Text("Какая то лєва подія: " + state.toString())
        );
      }
    });
  }
}