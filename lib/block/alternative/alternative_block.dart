import 'package:flutter_bloc/flutter_bloc.dart';

import 'alternative_event.dart';
import 'alternative_states.dart';

class AlternativeBlock extends Bloc<AlternativeEvent, AlternativeState> {
  AlternativeBlock(AlternativeState initialState) : super(AlternativeInitial());
  @override
  Stream<AlternativeState> mapEventToState(AlternativeEvent event) {
    if (event is AlternativeAdd) {
      yield* _mapAlternativeAdd(event);
    } else if (event is AlternativeGet) {
      yield* _mapAnmeGetAllToState();
    } else if (event is AlternativeDelete) {
      yield* _mapAnimeAddedToState(event);
    } else{
      print("Else");
    }
  }

  Stream<AlternativeAdded> _mapAlternativeAdd(AlternativeAdd event) async* {
    bool state = false;
    int animeId = event.alternativeTitle.animeId;
    int userId = event.alternativeTitle.userId;
    String body = event.alternativeTitle.body;
    String lang = event.alternativeTitle.lang;
    DateTime createdAt = DateTime.now();


    // int animeId = event.id;
    // //List<Anime> animes = await AnimeDao().getAnime(animeId);
    // List<Anime> animes = [];
    // Anime anime = await AnimeRepository().animeGet(animeId);
    // animes.add(anime);
    // AnimeSuccess state = AnimeSuccessFalse();
    // if(animes.length == 1){
    //   state = AnimeSuccessTrue(anime: animes);
    // }
    yield AlternativeAdded(success: state);
  }

}