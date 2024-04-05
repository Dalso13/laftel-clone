import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/week_state.dart';
import '../../../view_model/main_view_model.dart';
import '../../other_items/simple_anime_grid_view.dart';
import '../detail_item/week_change_item.dart';

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
          SimpleAnimeGridView(
            goDetailScreen: _onTab,
            modelList: state.weekAnimeList,
          )
        ],
      ),
    );
  }
}
