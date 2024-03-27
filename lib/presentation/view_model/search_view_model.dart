
import 'package:flutter/material.dart';
import 'package:laftel_clone/core/tag_state.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/search_state.dart';

import '../../domain/use_case/get_anime_data_use_case/interface/get_search_anime.dart';

class SearchViewModel extends ChangeNotifier {
  SearchState _state = const SearchState();
  final GetSearchAnime _getSearchAnime;
  final scrollController = ScrollController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  SearchViewModel({
    required GetSearchAnime getSearchAnime,
  }) : _getSearchAnime = getSearchAnime {
    searchAnimeList();
    _pagination();
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

  void _nextAnimeList() async {
    _state = _state.copyWith(
      isPagination: true,
    );
    notifyListeners();
    final list = await _getSearchAnime.getNextAnime(next: _state.nextUri);

    final model = state.searchAnimeList.toList()..addAll(list.model);


    _state = _state.copyWith(
      searchAnimeList: model,
      nextUri: list.next,
      searchAnimeListCount: list.count,
      isPagination: false,
    );
    notifyListeners();
  }

  void addTag(TagState tag) {
    final tagList = state.checkTag.toList()..add(tag);

    _state = _state.copyWith(
      checkTag: tagList,
    );
    notifyListeners();
  }

  void _pagination(){
    scrollController.addListener(() {
      //print('1');
      if(state.isPagination)return;
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        _nextAnimeList();
        //print('1');
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}