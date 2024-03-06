import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../view_model/detail_anime_view_model.dart';

class EpisodeBuyPage extends StatelessWidget {
  const EpisodeBuyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailAnimeViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('에피소드 구매'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle_outline),
                  ),
                  const Text('전체 선택'),
                  const Text('(0)'),
                ],
              ),
              const Text('첫화부터'),
              const Text('최신화부터')
            ],
          ),
          Expanded(
            child: ListView(
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                  .map(
                    (e) => ListTile(
                      leading: Image.network(
                        viewModel.detailAnime!.img,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      title: const Text('test'),
                      subtitle: const Text('대여 700P · 소장 1,500P'),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
