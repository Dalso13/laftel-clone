import 'package:flutter/material.dart';

class DetailAnimeSelectPageItem extends StatelessWidget {
  const DetailAnimeSelectPageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
          label: const Text('에피소드'),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.transparent,
          selected: true,
          onSelected: (bool value) {

          },
          showCheckmark: false,
          shape: const StadiumBorder(
              side: BorderSide(style: BorderStyle.none)),
        ),
        ChoiceChip(
          label: const Text('사용자 평'),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.deepPurple[400],
          selected: false,
          onSelected: (bool value) {

          },
          showCheckmark: false,
          shape: const StadiumBorder(
              side: BorderSide(style: BorderStyle.none)),
        ),
        ChoiceChip(
          label: const Text('비슷한 작품'),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.deepPurple[400],
          selected: false,
          onSelected: (bool value) {

          },
          showCheckmark: false,
          shape: const StadiumBorder(
              side: BorderSide(style: BorderStyle.none)),
        ),
      ],
    );
  }
}
