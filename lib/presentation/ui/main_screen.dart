import 'package:flutter/material.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';
import 'package:laftel_clone/presentation/ui/bottom_navi_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/theme_recommend_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/laftel_only_anim_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/week_new_anime.dart';
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
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.currency_bitcoin),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.doorbell),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                state.isLoading
                    ? Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        child: const CircularProgressIndicator())
                    : Column(
                        children: [
                          WeekNewAnime(
                            state: state,
                            onSelected: (WeekState week) {
                              viewModel.weekButtonChange(week);
                            },
                            animeList:
                                viewModel.getNowDayAnimeList(state.currentWeek),
                          ),
                          const MembershipItem(),
                          PopularAnimeItem(
                              state: state,
                              onSelected: (PopularAnimeState popular) {
                                viewModel.popularButtonChange(popular);
                              }),
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
}
