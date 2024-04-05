import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/presentation/ui/other_items/simple_anime_grid_view.dart';
import 'package:laftel_clone/presentation/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onSubmitted: (String text) {
                viewModel.searchAnimeList(query: text);
              },
            ),
          ),
          SimpleAnimeGridView(
            modelList: viewModel.state.animeList,
            goDetailScreen: ({required int id}) {
              context.push('/detail-anime', extra: id);
            },
            controller: viewModel.scrollController,
          ),
        ],
      ),
    );
  }
}
