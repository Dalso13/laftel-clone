import 'package:flutter/material.dart';

class DetailAnimeEpisodeItem extends StatelessWidget {
  final String _img;

  const DetailAnimeEpisodeItem({
    super.key,
    required String img,
  }) : _img = img;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        _img,
        width: 100,
        fit: BoxFit.cover,
      ),
      title: Text('test'),
      subtitle: Text('test'),
      trailing: Icon(Icons.download),
    );
  }


}
