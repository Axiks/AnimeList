import 'package:anime_list_app/models/anime.dart';
import 'package:anime_list_app/models/data.dart';
import 'package:anime_list_app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget{
  User adrian = Data().getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
          Column(
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
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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