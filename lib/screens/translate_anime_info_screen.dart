import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateAnimeInfoScreen extends StatelessWidget {
  final int animeId;
  const TranslateAnimeInfoScreen(this.animeId, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AnimeBlock>(
        create: (BuildContext context) => AnimeBlock(AnimeInitial()),
        child: BlocTranslateAnimeInfo(animeId),
      ),
    );
  }
}

class BlocTranslateAnimeInfo extends StatelessWidget {
  final int animeId;
  const BlocTranslateAnimeInfo(this.animeId, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimeGet animeBlo = AnimeGet(animeId);
    context.read<AnimeBlock>().add(animeBlo);

    return BlocBuilder<AnimeBlock, AnimeState>(
        builder: (context, state) {
          if(state is AnimeInitial){
            return Center(
                child: Text("Loading")
            );
          }else if(state is AnimeSuccessFalse){
            return Text("Помилка отримання даних");
          }else if(state is AnimeSuccessTrue){
            AnimeSuccessTrue as = state;
            List<Anime> animes = as.anime;
            Anime anime = animes.first;
            //Get CheckFav
            User neko = Data().getUser();

            return Container(
              child: TranslateAnimeInfoWidget(user: neko, anime: anime),
            );
          }else{
            return Center(
                child: Text("Невідома помилка: " + state.toString())
            );
          }
        }
    );
  }
}

class TranslateAnimeInfoWidget extends StatelessWidget {
  const TranslateAnimeInfoWidget({
    Key? key,
    required this.user,
    required this.anime,
  }) : super(key: key);

  final User user;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 64, 8, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: anime.mainPicture,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(anime.title,
                          style: new TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF212121),
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        Text(
                          anime.alternativeTitles['jp']!.first.toString(),
                          style: new TextStyle(
                            fontSize: 11.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF7C7C7C),
                          )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("myanimelist.net\nmalId: ${anime.malId}",
                          style: new TextStyle(
                            fontSize: 11.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF7C7C7C),
                          )
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(anime.title,
                    style: new TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Назвіть аніме українською"),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ExpandText(
                    anime.synopsis,
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    minLines: 1,
                    maxLines: 8,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Опишіть аніме українською"),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Зберегти'),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}