import 'package:flutter/material.dart';

import '../../../../../domain/model/detail_anime_model.dart';
import 'detail_anime_episode_item.dart';

class DetailAnimeEpisodePage extends StatelessWidget {
  final DetailAnimeModel _model;

  const DetailAnimeEpisodePage({
    super.key,
    required DetailAnimeModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ListTile(
              title: Text(
                _model.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              trailing: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Text(
                        '1화 부터',
                        style: TextStyle(
                            color: Theme.of(context).dividerColor),
                      ),
                      Icon(
                        Icons.swap_vert,
                        color: Theme.of(context).dividerColor,
                      )
                    ],
                  ),
                ),
              )),
          ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
              .map((e) => DetailAnimeEpisodeItem(img: _model.img))
              .toList()
        ],
      ),
    );
  }

}
