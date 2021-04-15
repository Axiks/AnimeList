import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/art.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimePageScreen extends StatelessWidget {
  const AnimePageScreen({
    Key key,
    @required this.anime,
  }) : super(key: key);
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black87, // status bar color
              brightness: Brightness.light,
              leading: Icon(Icons.chevron_left),
              expandedHeight: 190,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: FittedBox(
                  child: CachedNetworkImage(
                    imageUrl: anime.arts[0],
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  fit: BoxFit.fitWidth,
                ),
                title: Text(anime.alternativeTitles['ua']),
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HeadWidget(anime: anime),
                  ),
                  SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TagWidget(anime: anime),
                  ),
                  SizedBox(height: 10),
                  DescriptionWidget(anime: anime),
                  SizedBox(height: 10),
                  DubWidget(anime: anime),
                  SizedBox(height: 10),
                  ArtGalleryWidget(anime: anime),
                ])
            ),
          ]),
    );

    Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HeadWidget(anime: anime),
              // SizedBox(height: 20),
              // TagWidget(anime: anime),
              // SizedBox(height: 10),
              // DescriptionWidget(anime: anime),
              // SizedBox(height: 10),
              // DubWidget(anime: anime),
              // SizedBox(height: 10),
              // ArtGalleryWidget(anime: anime),
            ],
          ),
        ),
      ),
    );


  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    Key key,
    @required this.anime,
  }) : super(key: key);
  final Anime anime;

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
            ),          ),
        ),
        Expanded(
          flex: 7, // 60%
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    anime.alternativeTitles['ua'],
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
                    anime.alternativeTitles['en'],
                    style: new TextStyle(
                      fontSize: 11.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF7C7C7C),
                    ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                    '24 серій',
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF7C7C7C),
                    ),
                ),
                Text(
                    f.format(anime.startDate),
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
                FavAnimeWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FavAnimeWidget extends StatefulWidget {
  @override
  _FavAnimeWidget createState() => _FavAnimeWidget();
}

class _FavAnimeWidget extends State<FavAnimeWidget> {
  bool _favAnimeState = false;
  Icon _affectedByStateChange = new Icon(
    Icons.favorite,
    color: Colors.red,
  );


  @override
  Widget build(BuildContext context) {
    User neko = Data().getUser();
    List<Anime> nekoFavList = neko.favoriteAnime;
    //final foundAnime = nekoFavList.where((element) => element.malId == )

    _thisWillAffectTheState() {
      _affectedByStateChange = new Icon(Icons.favorite, color: Colors.red);
    }

    _thisWillAlsoAffectTheState() {
      _affectedByStateChange = new Icon(Icons.favorite_outline, color: Colors.grey);
    }

    return IconButton(
        icon: _affectedByStateChange,
        onPressed: (){
          setState(() {
            print("Fav btn preess: " + _favAnimeState.toString());

            if(_favAnimeState){
              _thisWillAffectTheState();
            }
            else{
              _thisWillAlsoAffectTheState();
            }
            _favAnimeState = !_favAnimeState;
          });
        }
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key key,
    @required this.anime,
  }) : super(key: key);

  final Anime anime;

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
  const ArtGalleryWidget({
    Key key,
    @required this.anime,
  }) : super(key: key);

  final Anime anime;

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
                      Art art = Art(index, anime);
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
  DubWidget({
    Key key,
    @required this.anime,
  }) : super(key: key);

  final Anime anime;
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
                              anime.alternativeTitles['ua'],
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
  const TagWidget({
    Key key,
    @required this.anime,
  }) : super(key: key);

  final Anime anime;

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
                            anime.genres[index],
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