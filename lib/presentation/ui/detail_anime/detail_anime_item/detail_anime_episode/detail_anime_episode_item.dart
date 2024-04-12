import 'package:flutter/material.dart';
import 'package:laftel_clone/domain/model/episode_anime_model.dart';

class DetailAnimeEpisodeItem extends StatelessWidget {
  final EpisodeAnimeModel _model;

  const DetailAnimeEpisodeItem({
    super.key,
    required EpisodeAnimeModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        _model.thumbnailPath,
        width: 100,
        fit: BoxFit.cover,
      ),
      title: Text('${_model.episodeOrder}화 ${_model.subject}'),
      subtitle: const Text('test'),
      trailing: const Icon(Icons.download),
    );
  }


}
