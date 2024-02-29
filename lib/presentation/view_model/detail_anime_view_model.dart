import 'package:flutter/material.dart';
import 'package:laftel_clone/core/detail_anime_menu_state.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_detail_anime.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/detail_anime_state.dart';

import '../../core/response_state.dart';
import '../../core/result.dart';
import '../../domain/model/detail_anime_model.dart';

class DetailAnimeViewModel extends ChangeNotifier {
  DetailAnimeState _detailAnimeState = const DetailAnimeState();

  final PageController pageController = PageController(initialPage: 0);
  final textController = TextEditingController();
  final GetDetailAnime _getDetailAnime;
  DetailAnimeModel? _detailAnime;

  DetailAnimeViewModel({
    required GetDetailAnime getDetailAnime,
  }) : _getDetailAnime = getDetailAnime;

  DetailAnimeModel? get detailAnime => _detailAnime;
  DetailAnimeState get detailAnimeState => _detailAnimeState;

  void setDetailAnime({required int id}) async {
    _detailAnimeState =
        _detailAnimeState.copyWith(detailResponseState: ResponseState.loading);
    notifyListeners();
    if (_detailAnimeState.menuState != DetailAnimeMenuState.episode) {
      _detailAnimeState =
          _detailAnimeState.copyWith(menuState: DetailAnimeMenuState.episode);
    }

    final detailAnime = await _getDetailAnime.getDetailAnimeModel(id: id);

    switch (detailAnime) {
      case Success<DetailAnimeModel>():
        _detailAnimeState = _detailAnimeState.copyWith(
            detailResponseState: ResponseState.success);
        _detailAnime = detailAnime.data;
      case Error():
        _detailAnimeState = _detailAnimeState.copyWith(
            detailResponseState: ResponseState.error);
    }
    notifyListeners();
  }

  void dragScrollPageChange({required int index}) {
    DetailAnimeMenuState currentIndex = DetailAnimeMenuState.values
        .where((element) => element.idx == index)
        .toList()
        .first;
    _detailAnimeState = _detailAnimeState.copyWith(menuState: currentIndex);
    notifyListeners();
  }

  void clickScrollPageChange({required DetailAnimeMenuState menuState}) {
    if(menuState == _detailAnimeState.menuState) return;
    pageController.animateToPage(
      menuState.idx,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    _detailAnimeState = _detailAnimeState.copyWith(menuState: menuState);
    notifyListeners();
  }

  void changeSpoilerEnabled() {
    _detailAnimeState = _detailAnimeState.copyWith(
      spoiler: !_detailAnimeState.spoiler
    );
    notifyListeners();
  }

  void onUpdateRating({required double rating}) {
    _detailAnimeState = _detailAnimeState.copyWith(
        rating: rating
    );
    notifyListeners();
  }
  void reSetCommendWriteState(){
    _detailAnimeState = _detailAnimeState.copyWith(
        rating: 0,
        spoiler: false,
    );
    textController.text = '';
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    textController.dispose();
    super.dispose();
  }
}
