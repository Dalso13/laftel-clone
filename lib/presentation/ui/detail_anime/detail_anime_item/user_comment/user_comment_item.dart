import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserCommentItem extends StatelessWidget {
  final double _model;

  const UserCommentItem({super.key, required double model}) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.black.withOpacity(0.1)),
        Padding(
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
                        initialRating: _model,
                        ignoreGestures: true,
                        allowHalfRating: true,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          '$_model',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Text('test$_model')
                ],
              ),
              Text(
                'year',
                style: TextStyle(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text('comment'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.thumb_up_off_alt,
                            color: Theme.of(context).dividerColor,
                            size: 16,
                          ),
                        ),
                        const Text(
                          '좋아요',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_vert_outlined,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
