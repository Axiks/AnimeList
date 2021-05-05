import 'dart:ui';

import 'package:anime_list_app/block/anime/anime_block.dart';
import 'package:anime_list_app/block/anime/anime_event.dart';
import 'package:anime_list_app/block/anime/anime_states.dart';
import 'package:anime_list_app/block/anime_favorite_check.dart';
import 'package:anime_list_app/block/favorite_event.dart';
import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/art.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/genres.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:collection/collection.dart';



class AnimePageScreen extends StatelessWidget {
  final Anime anime;
  const AnimePageScreen(this.anime, {Key? key}): super(key: key);

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
        child: AnimeBlocEngineWidget(animeId: anime.malId),
      ),
    );
  }
}

class AnimeBlocEngineWidget extends StatelessWidget {
  const AnimeBlocEngineWidget({
    Key? key,
    required this.animeId,
  }) : super(key: key);
  final int animeId;

  @override
  Widget build(BuildContext context) {
    //Get Anime
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
            FavoriteGet me = FavoriteGet(anime, neko);
            context.read<AnimeFavoriteCheck>().add(me);

            return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.black87, // status bar color
                    brightness: Brightness.light,
                    leading: Icon(Icons.chevron_left),
                    expandedHeight: 190,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Visibility(
                        child: SizedBox(
                          height: 200,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              FittedBox(
                                  child: CachedNetworkImage(
                                  imageUrl: anime.mainPicture,
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                              ClipRRect( // Clip it cleanly.
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.2),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                      title: Text(
                        anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "ua")?.body ?? anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "eng")?.body ?? "",
                      ),
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.blurBackground,
                        StretchMode.fadeTitle
                      ],
                    ),
                  ),
                  SliverDownWidget(anime: anime),
                ]);
          }else{
            return Center(
                child: Text("Какая то лєва подія: " + state.toString())
            );
          }
        }
    );
  }
}

class SliverDownWidget extends StatelessWidget {
  const SliverDownWidget({
    Key? key,
    required this.anime,
  }) : super(key: key);

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HeadWidget(anime),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/translate/${anime.malId}'),
              child: Text("Перекласти"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TagWidget(anime),
          ),
          SizedBox(height: 10),
          DescriptionWidget(anime),
          SizedBox(height: 10),
          DubWidget(anime),
          SizedBox(height: 10),
          ArtGalleryWidget(anime),
        ])
    );
  }
}

class HeadWidget extends StatelessWidget {
  final Anime anime;
  const HeadWidget(this.anime, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    initializeDateFormatting();
    final f = new DateFormat('d MMMM yyyy', 'uk_UA');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3, // 20%
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: CachedNetworkImage(
              imageUrl: anime.mainPicture,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Expanded(
          flex: 7, // 60%
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "ua")?.body ?? anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "eng")?.body ?? "",
                  style: new TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Visibility(
                  child: Text(
                    anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "eng")?.body ?? "null",
                      style: new TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF7C7C7C),
                      ),
                  ),
                  visible: anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "ua")?.body.isNotEmpty ?? false,
                ),
                SizedBox(
                  height: 2,
                ),
                Visibility(
                  child: Text(
                    anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "jp")?.body ?? "null",
                    style: new TextStyle(
                      fontSize: 11.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF7C7C7C),
                    ),
                  ),
                  visible: anime.alternativeTitles.firstWhereOrNull((element) => element.lang == "jp")?.body.isNotEmpty ?? false,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                    anime.episodes.toString() + ' серій',
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF7C7C7C),
                    ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                    f.format(anime.startDate) + (" - " + f.format(anime.endDate)),
                    // f.format(anime.startDate) + ' - ' + f.format(anime.endDate),
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF7C7C7C),
                    ),
                ),
                SizedBox(
                  height: 2,
                ),
                FavAnimeWidget(anime),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FavAnimeWidget extends StatefulWidget {
  final Anime anime;
  const FavAnimeWidget(this.anime);

  @override
  _FavAnimeWidget createState() => _FavAnimeWidget();
}

class _FavAnimeWidget extends State<FavAnimeWidget> {
  Icon _affectedByStateChange = new Icon(
    Icons.favorite,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    User neko = Data().getUser();
    Anime anime = widget.anime;

    _thisWillAffectTheState() {
      _affectedByStateChange = new Icon(Icons.favorite, color: Colors.red);
    }

    _thisWillAlsoAffectTheState() {
      _affectedByStateChange = new Icon(Icons.favorite_outline, color: Colors.grey);
      //Add Fav
      // User neko = Data().getUser();
      // // FavoriteAdded eve = FavoriteAdded(widget.anime, neko);
      // // context.read<AnimeFavoriteCheck>().add(eve);
    }

    return BlocBuilder<AnimeFavoriteCheck, bool>(
    builder: (context, state) {
      state ? _thisWillAffectTheState() : _thisWillAlsoAffectTheState();
      print("Love btn state: " + state.toString());
      return IconButton(
          icon: _affectedByStateChange,
          onPressed: (){
            setState(() {
              if(state){
                //Delete in favorite
                FavoriteDeleted eve = FavoriteDeleted(widget.anime, neko);
                context.read<AnimeFavoriteCheck>().add(eve);
                //Change icon
                _thisWillAffectTheState();
              }
              else{
                //Add to favorite
                FavoriteAdded eve = FavoriteAdded(widget.anime, neko);
                context.read<AnimeFavoriteCheck>().add(eve);
                //Change icon
                _thisWillAlsoAffectTheState();
              }
              //_favAnimeState = !_favAnimeState;
            });
          }
      );
    });
  }
}

class DescriptionWidget extends StatelessWidget {
  final Anime anime;
  const DescriptionWidget(this.anime, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Опис',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(height: 8),
                ExpandText(
                  anime.synopsis,
                  maxLines: 6,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ArtGalleryWidget extends StatelessWidget {
  final Anime anime;
  const ArtGalleryWidget(this.anime, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: anime.arts.length != 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Арти",
              style: Theme.of(context).textTheme.headline6,
              // style: TextStyle(
              //     fontSize: 21,
              //     fontWeight: FontWeight.bold
              // ),
            ),
          ),
          SizedBox(height: 4),
          SizedBox(
            height: 400.0,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: anime.arts.length,
                itemBuilder: (_, index)=> Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  child: InkWell(
                    onTap: () {
                      Art art = Art(
                        index: index,
                        href: anime.arts[index],
                        anime: anime
                      );
                      Navigator.pushNamed(context, '/image', arguments: art);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl: anime.arts[index],
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // child: Image.network(
                      //     anime.arts[index]
                      // ),
                    ),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}

class DubWidget extends StatelessWidget {
  final Anime anime;
  DubWidget(this.anime, {Key? key}): super(key: key);

  List <int> exampleList =  [1,2,3,4];

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Visibility(
          visible: anime.dubs.length != 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Даб",
                  style: Theme.of(context).textTheme.headline6,
                  // style: TextStyle(
                  //     fontSize: 21,
                  //     fontWeight: FontWeight.bold
                  // ),
                ),
              ),
              Column(
                  children: anime.dubs.map((dub) => new Card(
                    elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () => _launchURL(dub.href),
                        child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              anime.alternativeTitles.firstWhere((name) => name.lang == 'ua').body,
                              style: new TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Roboto',
                                color: new Color(0xFF212121),
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              dub.siteName,
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto',
                                  color: new Color(0xFF7C7C7C),
                                  fontStyle: FontStyle.italic,
                                ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            RichText(text: TextSpan(
                              style: new TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Roboto',
                                color: new Color(0xFF7C7C7C),
                                fontStyle: FontStyle.italic,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: dub.turnedOutSeriesCount.toString(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                TextSpan(
                                  text: " серій з "
                                ),
                                TextSpan(
                                    text: dub.turnedOutSeriesCount.toString()
                                ),
                              ]
                            ))
                          ],
                        ),
                      )
                    )
                  )
                  ).toList()
              ),
            ],
          ),
        ),
      );
  }
}

class TagWidget extends StatelessWidget {
  final Anime anime;
  const TagWidget(this.anime, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: anime.genres.length != 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 28.0,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: anime.genres.length,
                itemBuilder: (_, index)=> Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: new Color(0xFFE5E5E5),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Center(
                          child: Text(
                            anime.genres[index].nameUa,
                            style: TextStyle(
                              color: new Color(0xFF7C7C7C),
                              fontSize: 12
                            ),
                          ),
                        ),
                      )
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}