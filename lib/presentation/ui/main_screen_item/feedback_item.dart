import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'detail_item/feedback_detail_item.dart';

class FeedbackItem extends StatelessWidget {
  const FeedbackItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('잠깐! 라프텔을 잘 사용하고 계신가요?',style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                      builder: ((context) {
                        return const FeedbackDetailItem(isLike: true);
                      }),
                    );
                  },
                  child: Container(
                    color: Colors.deepPurple[100],
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    child: Text(
                      '네! 잘 쓰고 있어요',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                      builder: ((context) {
                        return const FeedbackDetailItem(isLike: false,);
                      }),
                    );
                  },
                  child: Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    width: 180,
                    child: Text(
                      '아니요! 문제가 있어요',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 12
                      ),
                    ),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
