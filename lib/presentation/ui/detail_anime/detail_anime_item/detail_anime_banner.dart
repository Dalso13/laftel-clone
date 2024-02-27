import 'package:flutter/material.dart';

import '../../../../domain/model/detail_anime_model.dart';
import 'detail_anime_more_screen.dart';

class DetailAnimeBanner extends StatelessWidget {
  final DetailAnimeModel _model;

  const DetailAnimeBanner({
    super.key,
    required DetailAnimeModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.none,
      background: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.7),
                  Colors.transparent
                ],
                stops: const [0.5, 0.75, 0.95],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.black.withOpacity(0.75),
                        margin: const EdgeInsets.only(right: 4.0, left: 4),
                        padding: const EdgeInsets.only(right: 4.0, left: 4),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4.0, left: 2),
                              child: Icon(Icons.star,
                                  color: Colors.white, size: 14),
                            ),
                            Text('${_model.avgRating}',
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  child: Text(
                    _model.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Text(
                        _model.mainTag
                            .where((element) => element.type == '장르')
                            .map((e) => e.name)
                            .toList()
                            .take(2)
                            .join('·'),
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 4, left: 4),
                        child: Text(
                          '|',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      Text(
                        '${_model.animationInfo.medium}·${_model.isEnding ? '완결' : '방영중'}',
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_circle_fill_outlined,
                          color: Colors.white, size: 56),
                      label: const Text('1화 재생하기',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                Text(
                                  '보고싶다',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.playlist_play,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                Text(
                                  '에피소드 구매',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 24.0, left: 8, right: 8),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _model.content.replaceAll('\n', ' '),
                          maxLines: 2,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.only(left: 1, right: 8),
                            color: Colors.black,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailAnimeMoreScreen(model: _model)),
                                );
                              },
                              child: const Text(
                                '더보기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
