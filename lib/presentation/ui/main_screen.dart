import 'package:flutter/material.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/day_recommend_item.dart';
import 'package:laftel_clone/presentation/ui/main_screen_item/week_new_anime.dart';

import 'main_screen_item/banner_item.dart';
import 'main_screen_item/membership_item.dart';
import 'main_screen_item/popular_anime_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> _selections = [
    {'name': '월', 'isBool': false},
    {'name': '화', 'isBool': false},
    {'name': '수', 'isBool': false},
    {'name': '목', 'isBool': false},
    {'name': '금', 'isBool': false},
    {'name': '토', 'isBool': false},
    {'name': '일', 'isBool': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.add_alert_outlined)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ],
                ),
              )),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
               children: [
                 const BannerItem(),
                 WeekNewAnime(selections: _selections, onSelected: () {
                   setState(() {
                   });
                 }),
                 const DayRecommendItem(),
                 const MembershipItem(),
                 const PopularAnimeItem(),
               ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
