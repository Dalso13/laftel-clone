import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laftel_clone/domain/model/theme_anime_model.dart';

class ThemeRecommendItem extends StatelessWidget {
  final ThemeAnimeModel _model;

  const ThemeRecommendItem({
    super.key,
    required ThemeAnimeModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 32),
          child: Text(
            _model.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 200,
          child: GridView.count(
              childAspectRatio: 0.8,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 15,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: _model.themeItemList
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        context.push('/detail-anime', extra: e.id);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(e.img,
                              fit: BoxFit.cover, height: 120,width: double.infinity),
                          Text(
                            e.name,
                            style: const TextStyle(color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }

}
