import 'package:flutter/material.dart';

class WeekNewAnime extends StatelessWidget {
  final List<Map<String, dynamic>> _selections;
  final void Function() _onSelected;

  const WeekNewAnime({
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
          height: 200,
          child: GridView.count(
              childAspectRatio: 0.8,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 15,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) =>  Column(
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
                    )
              )
                  .toList()),
        )
      ],
    );
  }
}
