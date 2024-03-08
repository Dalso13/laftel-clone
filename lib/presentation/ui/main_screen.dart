import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';
import 'package:laftel_clone/presentation/ui/bottom_navi_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/theme_recommend_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/laftel_only_anim_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/week_new_anime.dart';
import 'package:laftel_clone/presentation/ui/week_anime_list/week_anime_list_screen.dart';
import 'package:laftel_clone/presentation/ui_sealed/week_anime_event_sealed.dart';
import 'package:laftel_clone/presentation/view_model/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../core/week_state.dart';
import 'main_screen_item/banner_item.dart';
import 'main_screen_item/feedback_item.dart';
import 'main_screen_item/membership_item.dart';
import 'main_screen_item/popular_anime_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MainViewModel>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = context.watch<MainViewModel>();
    final state = viewModel.mainState;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverStack(
            children: const [
              SliverToBoxAdapter(
                child: BannerItem(),
              ),
              SliverAppBar(
                floating: false,
                pinned: true,
                leading: Icon(Icons.watch_later_outlined),
                actions: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_none_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                ],
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                state.isLoading
                    ? Container(
                        margin: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        child: const CircularProgressIndicator())
                    : Column(
                        children: [
                          WeekNewAnime(
                            state: state,
                            changeWeek: ({required WeekState week}) {
                              viewModel.weekButtonChange(week);
                            },
                            animeList:
                                viewModel.getNowDayAnimeList(state.currentWeek),
                            onTab: _goDetailScreen,
                            onEvent: (WeekAnimeEventSealed event) {
                              switch (event) {
                                case OnSelected():
                                  viewModel.weekButtonChange(event.week);
                                case OnPressed():
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider.value(
                                        value: viewModel,
                                        child: WeekAnimeListScreen(
                                          onTab: _goDetailScreen,
                                          changeWeek: ({required WeekState week}) {
                                            viewModel.weekButtonChange(week);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                case GoNoticePage():
                                  context.push('/notice');
                              }
                            },
                          ),
                          const MembershipItem(),
                          PopularAnimeItem(
                            state: state,
                            onSelected: (PopularAnimeState popular) {
                              viewModel.popularButtonChange(popular);
                            },
                            onTab: _goDetailScreen,
                          ),
                          ...state.themeAnimeList
                              .map((e) => ThemeRecommendItem(model: e)),
                          const LaftelOnlyItem(),
                          const FeedbackItem(),
                        ],
                      )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNaviItem(),
    );
  }

  void _goDetailScreen({required int id}) {
    context.push('/detail-anime', extra: id);
  }
}
