import 'package:flutter/material.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';
import 'package:laftel_clone/core/get_quarter.dart';
import 'package:laftel_clone/core/get_week_state.dart';
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

  void init() async {
    await _changeWeekAnimeList();
    await _changeThemeAnimeList();

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

  Future<void> _changeWeekAnimeList() async {
    final date = DateTime.now();
    final weekAnimeList = await _getQuarterAnime.getQuarter(
        '${date.year}', date.getQuarter());

    _mainState = _mainState.copyWith(
        weekAnimeList: weekAnimeList
    );

    _mainState = _mainState.copyWith(
      currentWeek: date.getWeekState()
    );
  }
  Future<void> _changeThemeAnimeList() async {
    final themeAnimeList = await _getQuarterAnime.getTheme();

    _mainState = _mainState.copyWith(
        themeAnimeList: themeAnimeList
    );
  }
}