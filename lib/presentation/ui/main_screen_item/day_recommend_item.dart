import 'package:flutter/material.dart';

class DayRecommendItem extends StatelessWidget {
  const DayRecommendItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('오늘의 추천작', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(
          height: 250,
          child: GridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 15,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => GridTile(
                  footer: const GridTileBar(
                    title: Text(
                      'test',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2023/08/30/18/02/leaves-8223869_1280.jpg'),
                ),
              )
                  .toList()),
        )
      ],
    );
  }
}
