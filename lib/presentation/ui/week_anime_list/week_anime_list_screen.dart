import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/week_state.dart';
import '../../view_model/main_view_model.dart';
import '../main_screen_item/detail_item/preview_anime_item.dart';
import '../main_screen_item/detail_item/week_change_item.dart';

class WeekAnimeListScreen extends StatelessWidget {
  final void Function({required int id}) _onTab;
  final void Function({required WeekState week}) _changeWeek;

  const WeekAnimeListScreen({
    super.key,
    required void Function({required int id}) onTab,
    required void Function({required WeekState week}) changeWeek,
  })  : _onTab = onTab,
        _changeWeek = changeWeek;

  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = context.watch<MainViewModel>();
    final state = viewModel.mainState;
    return Scaffold(
      appBar: AppBar(
        title: const Text('요일별 신작'),
      ),
      body: Column(
        children: [
          WeekChangeItem(
            changeWeek: _changeWeek,
            currentWeek: state.currentWeek,
          ),
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 15,
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 16),
              crossAxisCount: 2,
              children: viewModel
                  .getNowDayAnimeList(state.currentWeek)
                  .map((e) => PreviewAnimeItem(
                        model: e,
                        onTab: _onTab,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
