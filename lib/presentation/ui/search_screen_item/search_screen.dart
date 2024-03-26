import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/detail_item/preview_anime_item.dart';
import 'package:laftel_clone/presentation/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('태그검색'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.withOpacity(0.4)),
                bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('선택된 필터'),
                ),
                TextButton(onPressed: () {}, child: const Text('필터'))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        '총 ',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        '${state.searchAnimeListCount}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '개의 작품이 감지되었어요!',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('필터'))
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              controller: viewModel.scrollController,
              children: state.searchAnimeList
                  .map(
                    (e) => PreviewAnimeItem(
                      model: e,
                      onTab: ({required int id}) {
                        context.push('/detail-anime', extra: id);
                      },
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
