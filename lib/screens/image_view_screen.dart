import 'package:anime_list_app/models/art.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class ImageViewScreen extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    final Art art = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SnappingSheet(
          // TODO: Add your content that is placed
          // behind the sheet.
        child: Center(
          child: CachedNetworkImage(
            imageUrl: art.getImgUrl(),
          ),
        ),
        grabbingHeight: 65,
        // TODO: Add your grabbing widget here,
        grabbing: ImageInfoWidget(art: art),
        sheetBelow: SnappingSheetContent(
            child: Container(
              color: Colors.white,
            )
        ),
      )
    );
  }
}

class ImageInfoWidget extends StatelessWidget {
  const ImageInfoWidget({
    Key key,
    @required this.art,
  }) : super(key: key);

  final Art art;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            // Image.network(art.anime.mainPicture),
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: art.anime.mainPicture,
              ),
            ),
            Expanded(
              flex: 8,
              child: Text(art.anime.title),
            ),

          ],
        ),
      ),
    );
  }
}