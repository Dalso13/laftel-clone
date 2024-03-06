import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/core/detail_anime_menu_state.dart';
import 'package:laftel_clone/domain/model/detail_anime_model.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_banner.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_episode/detail_anime_episode_screen.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_related/detail_anime_related_screen.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/user_comment/user_comment_screen.dart';
import 'package:laftel_clone/presentation/view_model/view_model_state/detail_anime_state.dart';

import 'detail_anime_menu_item.dart';

class DetailAnimeItem extends StatelessWidget {
  final DetailAnimeModel _model;
  final DetailAnimeState _state;
  final void Function({required int id}) _onTab;
  final void Function({required DetailAnimeMenuState menuState}) _onSelected;
  final void Function({required int index}) _dragPageChange;
  final PageController _controller;
  final void Function() _goWriteScreen;
  final void Function() _goEpisodeBuyPage;

  const DetailAnimeItem({
    super.key,
    required DetailAnimeModel model,
    required DetailAnimeState state,
    required void Function({required int id}) onTab,
    required void Function({required DetailAnimeMenuState menuState})
        onSelected,
    required void Function({required int index}) dragPageChange,
    required PageController controller,
    required void Function() goWriteScreen,
    required void Function() goEpisodeBuyPage,
  })  : _model = model,
        _state = state,
        _onTab = onTab,
        _onSelected = onSelected,
        _controller = controller,
        _dragPageChange = dragPageChange,
        _goWriteScreen = goWriteScreen,
        _goEpisodeBuyPage = goEpisodeBuyPage;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.6,
              collapsedHeight: MediaQuery.of(context).size.height * 0.2,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.grey,
                onPressed: () {
                  context.pop();
                },
              ),
              flexibleSpace: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    _model.img,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    height: double.maxFinite,
                  ),
                  DetailAnimeBanner(
                    model: _model,
                    goEpisodeBuyPage: _goEpisodeBuyPage,
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                    color: Colors.white,
                  ),
                  child: DetailAnimeMenuItem(
                    menuState: _state.menuState,
                    onSelected: _onSelected,
                  ),
                ),
              ),
            ),
          ];
        },
        body: PageView(
          controller: _controller,
          children: [
            DetailAnimeEpisodeScreen(
              model: _model,
              onTab: _onTab,
            ),
            UserCommentScreen(
              rating: _model.avgRating,
              goWriteScreen: _goWriteScreen,
            ),
            DetailAnimeRelatedScreen(
              relatedList: _model.relatedItem,
              onTab: _onTab,
            )
          ],
          onPageChanged: (int value) {
            _dragPageChange(index: value);
          },
        ),
      ),
    );
  }
}
