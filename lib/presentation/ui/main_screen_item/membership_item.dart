import 'package:flutter/material.dart';

class MembershipItem extends StatelessWidget {
  const MembershipItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color:  const Color(0xffF0EDFE),
        borderRadius: BorderRadius.circular(8)
      ),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/img/membership.jpg', fit: BoxFit.none,),
      ),
    );
  }
}
