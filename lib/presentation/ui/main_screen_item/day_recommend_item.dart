import 'package:flutter/material.dart';

class DayRecommendItem extends StatelessWidget {
  const DayRecommendItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            '오늘의 추천작',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                            'https://cdn.pixabay.com/photo/2023/08/30/18/02/leaves-8223869_1280.jpg',
                            fit: BoxFit.cover, height: 120,width: double.infinity),
                        Text(
                          'test',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}
