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
    final state = viewModel.detailAnimeState;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('에피소드 구매'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: viewModel.episodeAllSelect,
                    icon: Icon(
                      Icons.check_circle,
                      color: state.selectEpisode.length != 10
                          ? Theme.of(context).dividerColor
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                  const Text('전체 선택'),
                  Text('(${state.selectEpisode.length})'),
                ],
              ),
              ToggleButtons(
                isSelected: [!state.episodeSorting, state.episodeSorting],
                onPressed: (int index) {
                  viewModel.episodeSorting();
                },
                borderColor: Colors.transparent,
                fillColor: Colors.transparent,
                selectedBorderColor: Colors.transparent,
                children: const [
                  Text('첫화부터'),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text('최신화부터'),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                  .map(
                    (e) => ListTile(
                      onTap: () {
                        viewModel.episodeSelect(id: e);
                      },
                      tileColor: !state.selectEpisode.contains(e)
                          ? Colors.transparent
                          : Theme.of(context).primaryColor.withOpacity(0.05),
                      leading: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            viewModel.detailAnime!.img,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          state.selectEpisode.contains(e)
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
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
