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
        fit: BoxFit.fitHeight,
      ),
      title: Text(
        '${_model.episodeOrder}화 ${_model.subject}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text('${_model.runningTime.inMinutes}분 · ${_getDateTime(_model.itemExpireDatetime)}'),
      trailing: const Icon(Icons.download),
    );
  }

  String _getDateTime(DateTime time) {
    return '${time.year}.${time.month}.${time.day}';
  }
}
