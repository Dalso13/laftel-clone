import 'package:flutter/material.dart';
import 'package:laftel_clone/core/finder_sort_state.dart';
import 'package:laftel_clone/core/tag_state.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/finder_state.dart';

import '../../domain/use_case/get_anime_data_use_case/interface/get_finder_anime.dart';

class FinderViewModel extends ChangeNotifier {
  FinderState _state = const FinderState();
  final GetFinderAnime _getSearchAnime;
  final scrollController = ScrollController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FinderViewModel({
    required GetFinderAnime getSearchAnime,
  }) : _getSearchAnime = getSearchAnime {
    searchAnimeList();
    _pagination();
  }

  FinderState get state => _state;

  void init() {
    searchAnimeList();
  }

  void searchAnimeList() async {
    List<String> years = [];
    List<String> genres = [];
    List<String> tags = [];
    List<String> broadcasts = [];
    List<String> releases = [];
    List<String> brands = [];

    if(_state.checkDetailTag.isNotEmpty){
      for (TagState tag in _state.checkDetailTag) {
        switch(tag.tagNum) {
          case 0: genres.add(tag.kr);
          break;
          case 1: tags.add(tag.kr);
          break;
          case 2: years.add(tag.kr);
          break;
          case 3: broadcasts.add(tag.kr);
          break;
          case 4: releases.add(tag.kr);
          break;
          case 5: brands.add(tag.kr);
          break;
        }
      }
    }
    final list = await _getSearchAnime.getFinderAnime(
      years: years,
      brands: brands,
      broadcasts: broadcasts,
      genres: genres,
      releases: releases,
      tags: tags
    );

    _state = _state.copyWith(
      finderAnimeList: list.model,
      nextUri: list.next,
      finderAnimeListCount: list.count,
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

  void selectSortMenu({required FinderSortState state}) {
    _state = _state.copyWith(
      currentState: state,
    );
    notifyListeners();
  }

  // 반복되는 코드를 줄여야한다.
  void selectDetailTag({required TagState tagState}) {
    final tagList = state.checkDetailTag.toList();

    if (tagList.contains(tagState) ||
        state.excludeDetailTag.contains(tagState.kr)) {
      tagList.remove(tagState);
      excludeDetailTag(tagName: tagState.kr);
    } else {
      tagList.add(tagState);
    }

    _state = _state.copyWith(
      checkDetailTag: tagList,
    );
    searchAnimeList();

    notifyListeners();
  }

  // 반복되는 코드를 줄여야한다.
  void removeSelectDetailTag({required String tagName}) {
    final tagList = state.checkDetailTag.toList();
    tagList.removeAt(tagList.map((e) => e.kr).toList().indexOf(tagName));

    _state = _state.copyWith(
      checkDetailTag: tagList,
    );
    searchAnimeList();
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

    final model = state.finderAnimeList.toList()..addAll(list.model);

    _state = _state.copyWith(
      finderAnimeList: model,
      nextUri: list.next,
      finderAnimeListCount: list.count,
      isPagination: false,
    );
    notifyListeners();
  }

  void _pagination() {
    scrollController.addListener(() {
      //print('1');
      if (_state.isPagination || _state.nextUri.isEmpty) return;
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
