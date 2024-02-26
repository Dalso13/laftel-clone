import 'package:flutter/material.dart';
import 'package:laftel_clone/core/response_state.dart';
import 'package:laftel_clone/presentation/view_model/detail_anime_view_model.dart';
import 'package:provider/provider.dart';

import 'detail_anime_item/detail_anime_item.dart';

class DetailAnimeScreen extends StatefulWidget {
  final int _id;

  const DetailAnimeScreen({
    super.key,
    required int id,
  }) : _id = id;

  @override
  State<DetailAnimeScreen> createState() => _DetailAnimeScreenState();
}

class _DetailAnimeScreenState extends State<DetailAnimeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<DetailAnimeViewModel>().setDetailAnime(id: widget._id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailAnimeViewModel>();
    return Scaffold(
      body: switch(viewModel.detailAnimeState.detailResponseState){
        ResponseState.success => viewModel.detailAnime == null ? null : DetailAnimeItem(model : viewModel.detailAnime!),

        ResponseState.loading => const Center(child: CircularProgressIndicator()),

        ResponseState.error => null,
    },
    );
  }
}
