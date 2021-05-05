import 'package:flutter/material.dart';

import '../models/anime.dart';

class AnimeDraggableScrollableScreen extends StatelessWidget {
  final Anime anime;
  const AnimeDraggableScrollableScreen(this.anime, {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
                child: SizedBox(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: anime.arts.length,
                      itemBuilder: (_, index)=> Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: 4.0
                        ),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                                anime.arts[index]
                            ),
                          ),
                        ),
                      )
                  ),
                )
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.75,
                minChildSize: 0.1,
                builder: (
                    BuildContext context,
                    ScrollController scrollConytroller){
                  return SingleChildScrollView(
                      controller: scrollConytroller,
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              topRight: Radius.circular(18.0),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            constraints: new BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        anime.mainPicture,
                                        width: 120,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                            horizontal: 12.0
                                        ),
                                        child: Text(
                                          anime.alternativeTitles.firstWhere((name) => name.lang == 'ua').body,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Опис",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(anime.synopsis),
                                ),
                                Visibility(
                                  visible: anime.arts.length != 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Арти",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      SizedBox(
                                        height: 200.0,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: anime.arts.length,
                                            itemBuilder: (_, index)=> Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15.0),
                                                child: Image.network(
                                                    anime.arts[index]
                                                ),
                                              ),
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  );
                }
            )
          ]
      ),
    );
  }
}