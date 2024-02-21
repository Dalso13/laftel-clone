import 'package:flutter/material.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';
import 'package:laftel_clone/core/week_state.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_quarter_anime.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/main_state.dart';

import '../../domain/model/simple_anime_model.dart';

class MainViewModel extends ChangeNotifier {

  final GetQuarterAnime _getQuarterAnime;
  MainState _mainState = const MainState();

  MainViewModel({
    required GetQuarterAnime getQuarterAnime,
  }) : _getQuarterAnime = getQuarterAnime;

  MainState get mainState => _mainState;

  List<SimpleAnimeModel> getNowDayAnimeList(WeekState week) {
    return _mainState.weekAnimeList.where((element) =>
    element.distributedAirTime == '${week.kr}요일').toList();
  }

  void init() {
    _changeWeekAnimeList();

    _mainState = _mainState.copyWith(
        isLoading: false
    );
    notifyListeners();
  }

  void weekButtonChange(WeekState week) {
    if (week == _mainState.currentWeek) return;
    _mainState = _mainState.copyWith(
        currentWeek: week
    );
    notifyListeners();
  }

  void popularButtonChange(PopularAnimeState popular) {
    if (popular == _mainState.currentPopular) return;
    _mainState = _mainState.copyWith(
        currentPopular: popular
    );
    notifyListeners();
  }

  Map<String, String> _getNowDate() {
    final date = DateTime.now();

    String quarter = '1';
    switch (date.month) {
      case 0:
      case 1:
      case 2:
        quarter = '1';
        break;
      case 3:
      case 4:
      case 5:
        quarter = '2';
        break;
      case 6:
      case 7:
      case 8:
        quarter = '3';
        break;
      case 9:
      case 10:
      case 11:
        quarter = '4';
        break;
    }

    return {'year': '${date.year}', 'quarter': quarter};
  }

  void _changeWeekAnimeList() async {
    final nowDate = _getNowDate();
    final weekAnimeList = await _getQuarterAnime.execute(
        nowDate['year']!, nowDate['quarter']!);

    _mainState = _mainState.copyWith(
        weekAnimeList: weekAnimeList
    );
  }
}