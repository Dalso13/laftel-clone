
import 'package:flutter/material.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/search_state.dart';

import '../../domain/use_case/get_anime_data_use_case/interface/get_search_anime.dart';

class SearchViewModel extends ChangeNotifier {
  SearchState _state = const SearchState();
  final GetSearchAnime _getSearchAnime;

  SearchViewModel({
    required GetSearchAnime getSearchAnime,
  }) : _getSearchAnime = getSearchAnime {
    searchAnimeList();
  }

  SearchState get state => _state;

  void init() {
    searchAnimeList();
  }

  void searchAnimeList() async {
   final list = await _getSearchAnime.getSearchAnime();

   _state = _state.copyWith(
     searchAnimeList: list.model,
     nextUri: list.next,
     searchAnimeListCount: list.count,
   );
   notifyListeners();
  }

  void nextAnimeList() async {
    final list = await _getSearchAnime.getNextAnime(next: _state.nextUri);

    _state = _state.copyWith(
      searchAnimeList: list.model,
      nextUri: list.next,
      searchAnimeListCount: list.count,
    );
    notifyListeners();
  }
}