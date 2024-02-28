import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laftel_clone/presentation/ui/detail_anime/detail_anime_item/user_comment/user_comment_item.dart';

import 'comment_write_item.dart';
import 'mock_chart.dart';

class UserCommentScreen extends StatelessWidget {
  final double _rating;
  final void Function() _goWriteScreen;

  const UserCommentScreen({
    super.key,
    required double rating,
    required void Function() goWriteScreen,
  }) : _rating = rating, _goWriteScreen = goWriteScreen;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    Text('$_rating',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32)),
                    RatingBar(
                      initialRating: _rating,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full:
                            Icon(Icons.star, color: Theme.of(context).primaryColor),
                        half: Icon(Icons.star_half,
                            color: Theme.of(context).primaryColor),
                        empty: Icon(Icons.star,
                            color: Theme.of(context).dividerColor.withOpacity(0.3)),
                      ),
                      itemSize: 16,
                      onRatingUpdate: (double value) {},
                    ),
                    Text('0개의 별점',
                        style: TextStyle(color: Theme.of(context).dividerColor)),
                  ],
                ),
              ),
              Column(
                children: [
                  const MockChart(),
                  Row(
                    children: [1.0,2.0,3.0,4.0,5.0].map((e) => Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('$e',style: TextStyle(color: Theme.of(context).dividerColor)),
                    )).toList(),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('리뷰 ()'),
              InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Text(
                      '좋아요순',
                    ),
                    Icon(
                      Icons.swap_vert,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        CommentWriteItem(goWriteScreen: _goWriteScreen),
        ...[1, 2, 3, 4, 5, 6, 7, 8].map((e) {
          return UserCommentItem(model: e + 0.0);
        }).toList()
      ],
    );
  }
}
