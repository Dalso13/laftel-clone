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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: !viewModel.state.isFocus
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              )
            : null,
        title: TextField(
          controller: viewModel.textController,
          focusNode: viewModel.focusNode,
          decoration: InputDecoration(
            hintText: "제목, 제작사, 감독으로 검색 (초성)",
            prefixIcon:
                viewModel.state.isFocus ? const Icon(Icons.search) : null,
            suffixIcon: viewModel.textController.text == ''
                ? null
                : IconButton(
                    onPressed: viewModel.clearTextField,
                    icon: Icon(Icons.remove_circle_outline),
                  ),
          ),
          onSubmitted: (String text) {
            viewModel.searchAnimeList(query: text);
          },
        ),
      ),
      body: Column(
        children: [
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
