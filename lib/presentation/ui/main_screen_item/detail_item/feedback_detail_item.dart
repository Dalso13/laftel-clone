import 'package:flutter/material.dart';

class FeedbackDetailItem extends StatelessWidget {
  final bool _isLike;

  const FeedbackDetailItem({super.key, required bool isLike})
      : _isLike = isLike;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        _isLike
            ? "앱스토어에 평가 해주시겠어요?"
            : "어떤 어려움이 있으셨나요? \n 고객센터>챗봇을 통해 의견을 주시면 더\n나은 라프텔을 만드는 데 큰 도움이\n됩니다.",
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.grey,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: 100,
                child: Text(
                  '다음에 할게요',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
              onTap: () {},
              child: Container(
                color: Colors.deepPurple[100],
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: 100,
                child: Text(
                  _isLike ? '네, 좋아요' : '의견 남기기',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
