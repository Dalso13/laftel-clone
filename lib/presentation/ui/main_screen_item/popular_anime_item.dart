import 'package:flutter/material.dart';
import 'package:laftel_clone/core/Popular_anime_state.dart';

class PopularAnimeItem extends StatelessWidget {
  const PopularAnimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '라프텔 인기 애니',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: PopularAnimeState.values.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ChoiceChip(
                    labelPadding: const EdgeInsets.all(4.0),
                    label: Text(e.value),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    selectedColor: Colors.deepPurple[200],
                    selected: false,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    onSelected: (bool value) {
                      if (value) return;
                    },
                    showCheckmark: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: GridView.count(
                childAspectRatio: 0.3,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 15,
                crossAxisCount: 3,
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6].map((e) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://cdn.pixabay.com/photo/2023/08/30/18/02/leaves-8223869_1280.jpg',
                        width: 130,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 8, left: 8),
                          child: Text(
                            '${[1, 2, 3, 4, 5, 6].indexOf(e)}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 16, bottom: 8),
                              child: Text(
                                'testtesttesttesttesttesttest',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              'tag',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
