import 'package:flutter/material.dart';

class MockChart extends StatelessWidget {
  const MockChart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 20,
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),Container(
          width: 15,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(4)
          ),
          margin: const EdgeInsets.only(left: 2),
        ),
      ],
    );
  }
}
