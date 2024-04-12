import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/domain/model/series_anime_model.dart';

class SeriesListScreen extends StatelessWidget {
  final List<SeriesAnimeModel> _series;
  final void Function({required int id}) _onTab;


  const SeriesListScreen({
    super.key,
    required List<SeriesAnimeModel> series,
    required void Function({required int id}) onTab,
  })  : _series = series,
        _onTab = onTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: _series.map((e) {
                return ListTile(
                  onTap: () {
                    _onTab(id: e.id);
                    context.pop();
                  },
                  leading: const SizedBox(
                    width: 30,
                    height: 30,
                  ),
                  title: Text(
                    e.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.clear),
          onTap: () {
            context.pop();
          },
          title: const Text('취소'),
        )
      ],
    );
  }
}
