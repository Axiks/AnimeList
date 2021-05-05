import 'package:anime_list_app/database/database.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitle.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitleDescription.dart';
import 'package:anime_list_app/models/connectors/alternative/alternativeTitleName.dart';
import 'package:sqflite/sqflite.dart';

class AlternativeDao{
  final dbProvider = DBProvider();
  //String _tableName = tableAlternativeTitleName;
  List<String> columns = [
    AlternativeTitleFiels.id,
    AlternativeTitleFiels.animeId,
    AlternativeTitleFiels.userId,
    AlternativeTitleFiels.lang,
    AlternativeTitleFiels.body,
    AlternativeTitleFiels.createdAt,
  ];

  Future<List<AlternativeName>> getAlternativeName(int animeId) async {
    Database db = await dbProvider.initializeDB();
    List<Map<String, dynamic>> result = await db.query(tableAlternativeTitleName,
        columns: columns,
        where: '${AlternativeTitleFiels.animeId} = ?',
        whereArgs: [animeId]
    );
    List<AlternativeName> answer = result.isNotEmpty
        ? result.map((item) => AlternativeName.fromDatabaseJson(item)).toList()
        : [];
    print("getAlternativeName/List: " + answer.toString());
    return answer;
  }

  Future<List<AlternativeDescription>> getAlternativeDescription(int animeId) async {
  Database db = await dbProvider.initializeDB();
    List<Map<String, dynamic>> result = await db.query(tableAlternativeTitleDescription,
        columns: columns,
        where: '${AlternativeTitleFiels.animeId} = ?',
        whereArgs: [animeId]
    );

    List<AlternativeDescription> answer = result.isNotEmpty
        ? result.map((item) => AlternativeDescription.fromDatabaseJson(item)).toList()
        : [];
    return answer;
  }

  //Adds new Alternative records
  Future<bool> addAlternative(AlternativeTitle altTitleItem) async {
    Database db = await dbProvider.initializeDB();
    String _tableName = "";
    if(altTitleItem is AlternativeName){
      _tableName = tableAlternativeTitleName;
    }else if(altTitleItem is AlternativeDescription){
      _tableName = tableAlternativeTitleDescription;
    }
    else{
      return false;
    }
    print("addAlternative: " + altTitleItem.toString());
    int id = await db.insert(_tableName, altTitleItem.toJson());
    print("Id: " + id.toString());
    bool status = false;
    if (id > 0){
      status = true;
    }
    return status;
  }

  //Delete Alternative records
  Future<bool> deleteAlternative(AlternativeTitle altTitleItem) async {
    Database db = await dbProvider.initializeDB();
    String _tableName = "";
    if(altTitleItem is AlternativeName){
      _tableName = tableAlternativeTitleName;
    }else if(altTitleItem is AlternativeDescription){
      _tableName = tableAlternativeTitleDescription;
    }
    else{
      return false;
    }
    int result = await db.delete(_tableName, where: '${AlternativeTitleFiels.id} = ?', whereArgs: [altTitleItem.id]);
    bool status = false;
    if (result > 0){
      status = true;
    }
    return status;
  }
}