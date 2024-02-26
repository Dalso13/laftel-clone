import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/domain/model/detail_anime_model.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_banner.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_episode/detail_anime_episode_item.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/detail_anime_episode/detail_anime_episode_page.dart';

class DetailAnimeItem extends StatelessWidget {
  final DetailAnimeModel _model;

  const DetailAnimeItem({
    super.key,
    required DetailAnimeModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
                  color: Colors.white),
              child: Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('에피소드')),
                  TextButton(onPressed: () {}, child: const Text('사용자 평')),
                  TextButton(onPressed: () {}, child: const Text('비슷한 작품')),
                ],
              ),
            ),
          ),
        ),
        DetailAnimeEpisodePage(model: _model)
      ],
    );
  }
}
