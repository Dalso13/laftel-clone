import 'package:flutter/material.dart';
import '../../../../domain/model/detail_anime_model.dart';

class DetailAnimeMoreScreen extends StatelessWidget {
  final DetailAnimeModel _model;

  const DetailAnimeMoreScreen({
    super.key,
    required DetailAnimeModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('작품 정보', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('줄거리', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_model.content),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('태그', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: _model.mainTag.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0, bottom: 4),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple[50],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                        },
                        child: Text('#${e}', style: const TextStyle(fontSize: 12)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text('제작 정보', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text('제작', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Text(_model.animationInfo.production),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text('출시', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Text(_model.animationInfo.airYearQuarter),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('등급 및 내용정보', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Text(_model.contentRating)
                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }


}
