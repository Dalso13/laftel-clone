import 'package:flutter/material.dart';
import 'package:laftel_clone/domain/use_case/get_anime_data_use_case/interface/get_detail_anime.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/detail_anime_state.dart';

import '../../core/response_state.dart';
import '../../core/result.dart';
import '../../domain/model/detail_anime_model.dart';

class DetailAnimeViewModel extends ChangeNotifier {
  DetailAnimeState _detailAnimeState = const DetailAnimeState();
  final GetDetailAnime _getDetailAnime;
  DetailAnimeModel? _detailAnime;

  DetailAnimeViewModel({
    required GetDetailAnime getDetailAnime,
  }) : _getDetailAnime = getDetailAnime;

  DetailAnimeModel? get detailAnime => _detailAnime;
  DetailAnimeState get detailAnimeState => _detailAnimeState;


  void setDetailAnime({required int id}) async {
    _detailAnimeState = _detailAnimeState.copyWith(
        detailResponseState: ResponseState.loading
    );
    notifyListeners();
    final detailAnime = await _getDetailAnime.getDetailAnimeModel(id: id);

    switch(detailAnime) {
      case Success<DetailAnimeModel>():
        _detailAnimeState = _detailAnimeState.copyWith(
            detailResponseState: ResponseState.success
        );
        _detailAnime = detailAnime.data;
      case Error():
        _detailAnimeState = _detailAnimeState.copyWith(
          detailResponseState: ResponseState.error
        );
    }
    notifyListeners();
  }
}