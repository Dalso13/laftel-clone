import 'package:flutter/material.dart';
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

  void selectTag({required int tagNum}) {
    final tagList = state.checkTag.toList();

    tagList.contains(tagNum) ? tagList.remove(tagNum) : tagList.add(tagNum);

    _state = _state.copyWith(
      checkTag: tagList,
    );
    notifyListeners();
  }

  // 반복되는 코드를 줄여야한다.
  void selectDetailTag({required String tagName}) {
    final tagList = state.checkDetailTag.toList();

    if (state.checkDetailTag.contains(tagName) ||
        state.excludeDetailTag.contains(tagName)) {
      tagList.remove(tagName);
      excludeDetailTag(tagName: tagName);
    } else {
      tagList.add(tagName);
    }

    _state = _state.copyWith(
      checkDetailTag: tagList,
    );

    notifyListeners();
  }

  // 반복되는 코드를 줄여야한다.
  void removeSelectDetailTag({required String tagName}) {
    final tagList = state.checkDetailTag.toList();
    tagList.remove(tagName);

    _state = _state.copyWith(
      checkDetailTag: tagList,
    );
    notifyListeners();
  }

  // 반복되는 코드를 줄여야한다.
  void removeExcludeDetailTag({required String tagName}) {
    final tagList = state.excludeDetailTag.toList();
    tagList.remove(tagName);

    _state = _state.copyWith(
      excludeDetailTag: tagList,
    );
    notifyListeners();
  }

  // 반복되는 코드를 줄여야한다.
  void excludeDetailTag({required String tagName}) {
    final tagList = state.excludeDetailTag.toList();
    state.excludeDetailTag.contains(tagName)
        ? tagList.remove(tagName)
        : tagList.add(tagName);

    _state = _state.copyWith(
      excludeDetailTag: tagList,
    );
  }

  void selectPossibleView() {
    _state = _state.copyWith(
      checkPossibleView: !_state.checkPossibleView,
    );
    notifyListeners();
  }

  void selectMembership() {
    _state = _state.copyWith(
      checkMembership: !_state.checkMembership,
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

  void _pagination() {
    scrollController.addListener(() {
      //print('1');
      if (state.isPagination) return;
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
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
