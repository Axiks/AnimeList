import 'package:anime_list_app/dao/alternative_dao.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitleDescription.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitleName.dart';

class AlternativeRepository{
  Future<List<AlternativeName>> alternativeNameGet(int animeId) async {
    List<AlternativeName> alternativeName = await AlternativeDao().getAlternativeName(animeId);
    return alternativeName;
  }

  Future<List<AlternativeDescription>> alternativeDescriptionGet(int animeId) async {
    List<AlternativeDescription> alternativeDescription = await AlternativeDao().getAlternativeDescription(animeId);
    return alternativeDescription;
  }

  Future<bool> alternativeAdd(AlternativeTitle altTitleItem) async {
    bool success = false;
    success = await AlternativeDao().addAlternative(altTitleItem);
    return success;
  }

  Future<bool> alternativeDelete(AlternativeTitle altTitleItem) async {
    bool success = false;
    success = await AlternativeDao().deleteAlternative(altTitleItem);
    return success;
  }
}