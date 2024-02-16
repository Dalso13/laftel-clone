import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  CarouselController buttonCarouselController = CarouselController();
  final List<int> _data = [1,2,3];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
        children: [
          CarouselSlider(
            items: _data.map((e) {
              return SizedBox(
                height: MediaQuery.of(context).size.height*0.30,
                width: double.maxFinite,
                child: Card(
                  color: Colors.blueAccent,
                  child: Text('$e'),
                ),
              );
            }).toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _data.map((e) {
                int index = _data.indexOf(e);
                return Container(
                  width: 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == _currentIndex ? Colors.white : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ]
    );
  }
}
