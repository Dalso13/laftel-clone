import 'package:flutter/material.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_search_anime.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/search_state.dart';

class SearchViewModel extends ChangeNotifier {
  SearchState _state = const SearchState();
  final ScrollController _scrollController = ScrollController();
  final GetSearchAnime _getSearchAnime;

  SearchViewModel({
    required GetSearchAnime getSearchAnime,
  }) : _getSearchAnime = getSearchAnime {
    _pagination();
  }

  ScrollController get scrollController => _scrollController;
  SearchState get state => _state;

  void searchAnimeList({required String query}) async {
    final list = await _getSearchAnime.getSearchAnime(query: query);

    _state = _state.copyWith(
      animeList: list.model,
      nextUri: list.next,
    );
    notifyListeners();
  }


  void _pagination() {
    _scrollController.addListener(() {
      //print('1');
      if (_state.isPagination || _state.nextUri.isEmpty) return;
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _nextAnimeList();
        //print('1');
      }
    });
  }

  void _nextAnimeList() async {
    _state = _state.copyWith(
      isPagination: true,
    );
    notifyListeners();
    final list = await _getSearchAnime.getNextAnime(next: _state.nextUri);

    final model = state.animeList.toList()..addAll(list.model);

    _state = _state.copyWith(
      animeList: model,
      nextUri: list.next,
      isPagination: false,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}