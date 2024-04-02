import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/detail_item/preview_anime_item.dart';
import 'package:laftel_clone/presentation/ui/search_screen_item/search_screen_item/search_sort_screen.dart';
import 'package:laftel_clone/presentation/ui/search_screen_item/search_screen_item/select_tag_list_item.dart';
import 'package:laftel_clone/presentation/ui/search_screen_item/search_screen_item/tag_drawer_menu.dart';
import 'package:laftel_clone/presentation/view_model/search_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/search_sort_state.dart';
import '../../ui_sealed/search_sealed.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    final state = viewModel.state;
    return Scaffold(
      key: viewModel.scaffoldKey,
      drawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        child: TagDrawerMenu(
          state: state,
          onEvent: (SearchSealed event) {
            switch (event) {
              case ViewPossible():
                viewModel.selectPossibleView();
              case Membership():
                viewModel.selectMembership();
              case TagSelect():
                viewModel.selectTag(tagNum: event.tagNum);
              case DetailTagSelect():
                viewModel.selectDetailTag(tagName: event.tagName);
            }
          },
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '태그검색',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
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
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      viewModel.scaffoldKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.black,
                      size: 15,
                    ),
                    label: const Text(
                      '필터',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          state.checkDetailTag.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.check_box_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SelectTagListItem(
                        tagNames: state.checkDetailTag,
                        onPressed: viewModel.removeSelectDetailTag,
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          state.excludeDetailTag.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.indeterminate_check_box_outlined,
                          color: Colors.redAccent,
                        ),
                      ),
                      SelectTagListItem(
                        tagNames: state.excludeDetailTag,
                        onPressed: viewModel.removeExcludeDetailTag,
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
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
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return DraggableScrollableSheet(
                            expand: false,
                            minChildSize: 0.2,
                            builder: (context, scrollController) =>
                                SearchSortScreen(
                              onChanged: ({required SearchSortState state}) {
                                viewModel.selectSortMenu(state: state);
                                context.pop();
                              },
                              currentState: state.currentState,
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      state.currentState.kr,
                      style: TextStyle(
                        color: Theme.of(context).dividerColor,
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 16),
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
