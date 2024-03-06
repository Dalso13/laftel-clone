import 'package:flutter/material.dart';
import 'package:laftel_clone/core/response_state.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_episode/episode_buy/episode_buy_page.dart';
import 'package:laftel_clone/presentation/view_model/detail_anime_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/detail_anime_menu_state.dart';
import 'detail_anime_item/detail_anime_item.dart';
import 'detail_anime_item/user_comment/comment_write_screen.dart';

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
      body: switch (viewModel.detailAnimeState.detailResponseState) {
        ResponseState.success => viewModel.detailAnime == null
            ? null
            : DetailAnimeItem(
                model: viewModel.detailAnime!,
                state: viewModel.detailAnimeState,
                onTab: ({required int id}) {
                  viewModel.setDetailAnime(id: id);
                },
                controller: viewModel.pageController,
                onSelected: ({required DetailAnimeMenuState menuState}) {
                  viewModel.clickScrollPageChange(menuState: menuState);
                },
                dragPageChange: ({required int index}) {
                  viewModel.dragScrollPageChange(index: index);
                },
                goWriteScreen: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8))),
                    builder: (context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        minChildSize: 0.3,
                        initialChildSize: 0.5,
                        maxChildSize: 0.9,
                        builder: (context, scrollController) =>
                            ChangeNotifierProvider.value(
                          value: viewModel,
                          child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: const CommentWriteScreen(),
                          ),
                        ),
                      );
                    },
                  ).then(
                    (value) => viewModel.reSetCommendWriteState(),
                  );
                },
                goEpisodeBuyPage: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: viewModel,
                        child: const EpisodeBuyPage(),
                      ),
                    ),
                  );
                },
              ),
        ResponseState.loading =>
          const Center(child: CircularProgressIndicator()),
        ResponseState.error => null,
      },
    );
  }
}
