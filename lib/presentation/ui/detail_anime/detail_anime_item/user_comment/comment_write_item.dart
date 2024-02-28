import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentWriteItem extends StatelessWidget {
  final void Function() _goWriteScreen;


  const CommentWriteItem({
    super.key,
    required void Function() goWriteScreen,
  }) : _goWriteScreen = goWriteScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black.withOpacity(0.1)),
        InkWell(
          onTap: _goWriteScreen,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBar(
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star,
                                color: Theme.of(context).primaryColor),
                            half: Icon(Icons.star_half,
                                color: Theme.of(context).primaryColor),
                            empty: Icon(Icons.star,
                                color: Theme.of(context)
                                    .dividerColor
                                    .withOpacity(0.3)),
                          ),
                          itemSize: 15,
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    ),
                    const Text('user')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    '이 작품에 대한 내 평가를 남겨보세요!',
                    style: TextStyle(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
