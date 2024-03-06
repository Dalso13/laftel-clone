import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../../../view_model/detail_anime_view_model.dart';

class CommentWriteScreen extends StatelessWidget {
  const CommentWriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailAnimeViewModel>();
    final state = viewModel.detailAnimeState;
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear)),
          ),
          Column(
            children: [
              Text(
                '${state.rating}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: state.rating == 0
                      ? Theme.of(context).dividerColor
                      : Theme.of(context).shadowColor,
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  ratingLabel(rate: state.rating),
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar(
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
                  itemSize: 40,
                  onRatingUpdate: (double value) {
                    viewModel.onUpdateRating(rating: value);
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: viewModel.textController,
                  maxLength: 300,
                  scrollPadding: const EdgeInsets.all(8.0),
                  style: const TextStyle(fontSize: 12),
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: '이 작품에 대한 내 생각을 남겨보세요!',
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: TextButton.icon(
                  onPressed: viewModel.changeSpoilerEnabled,
                  icon: state.spoiler
                      ? const Icon(Icons.check_box_outlined)
                      : Icon(Icons.check_box_outline_blank,
                          color: Theme.of(context).dividerColor),
                  label: Text(
                    '스포일러',
                    style: TextStyle(
                      color: state.spoiler
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          viewModel.textController.text == '' && state.rating == 0.0
              ? Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  padding: const EdgeInsets.all(14),
                  color: Theme.of(context).highlightColor,
                  alignment: Alignment.center,
                  child: const Text(
                    '등록',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  color: Theme.of(context).primaryColor,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '등록',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  String ratingLabel({required double rate}) {
    String rateLabel;
    switch (rate) {
      case 0:
        rateLabel = '별점을 남겨주세요';
        break;
      case 0.5:
        rateLabel = '그동안 즐거웠고 다시는 만나지 말자';
        break;
      case 1:
        rateLabel = '아잇.. 너 참 싫다..';
        break;
      case 1.5:
        rateLabel = '별로예요 :(';
        break;
      case 2:
        rateLabel = '아쉬워요';
        break;
      case 2.5:
        rateLabel = '약간 부족해요';
        break;
      case 3:
        rateLabel = '볼만해요';
        break;
      case 3.5:
        rateLabel = '꽤 재미있어요 ᵔ.ᵔ';
        break;
      case 4:
        rateLabel = '이 작품을 추천해요!';
        break;
      case 4.5:
        rateLabel = '취향 저격, 헤이! 츄라이! 츄라이!';
        break;
      case 5:
        rateLabel = '더 이상 말이 필요없는 갓 띵작';
        break;
      default:
        rateLabel = '별점을 남겨주세요';
    }
    return rateLabel;
  }
}
