import 'package:anime_list_app/models/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class AnimesListWidget extends StatelessWidget {
  final List<Anime> animes;
  const AnimesListWidget(this.animes, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
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
                            animes[index].alternativeTitles.firstWhereOrNull((element) => element.lang == "ua")?.body ?? animes[index].title,
                            //animes[index].alternativeTitles.firstWhere((name) => name?.lang == 'ua')?.body ?? "nima",
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
                            animes[index].alternativeTitles.firstWhereOrNull((element) => element.lang == "eng")?.body ?? "null",
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
    );
  }
}