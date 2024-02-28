import 'package:flutter/material.dart';

class LaftelOnlyItem extends StatelessWidget {
  const LaftelOnlyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            '라프텔에서만 볼 수 있는 독점 작품!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 250,
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
                        fit: BoxFit.cover, height: 160,width: double.infinity),
                    const Text(
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
