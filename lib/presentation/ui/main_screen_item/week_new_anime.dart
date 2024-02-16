import 'package:flutter/material.dart';

class WeekNewAnime extends StatelessWidget {
  List<Map<String, dynamic>> _selections;
  final void Function() _onSelected;

  WeekNewAnime({
    super.key,
    required List<Map<String, dynamic>> selections,
    required void Function() onSelected,
  })  : _selections = selections,
        _onSelected = onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('요일별 신작'),
                  TextButton(
                    onPressed: () {},
                    child: Text('업로드 공지'),
                  ),
                ],
              ),
              Text('더보기 >')
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: _selections
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ChoiceChip(
                        labelPadding: const EdgeInsets.all(4.0),
                        label: Text(e['name']),
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        backgroundColor: Colors.grey[400],
                        selectedColor: Colors.deepPurple[200],
                        selected: e['isBool'],
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        onSelected: (bool value) {
                          e['isBool'] = value;
                          _onSelected();
                        },
                        showCheckmark: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60))),
                      ),
                    ),
                  )
                  .toList()),
        ),
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
