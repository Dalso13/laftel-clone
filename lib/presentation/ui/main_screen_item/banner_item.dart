import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  CarouselSliderController  buttonCarouselController = CarouselSliderController ();
  final List<int> _data = [1,2];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
        children: [
          CarouselSlider(
            items: _data.map((e) {
              return Image.asset('assets/img/logo${e}.png');
            }).toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              height: 500
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

/*
* SizedBox(
            height: 500,
            width: double.maxFinite,
            child: PageView(
              controller: pageController,
              children: _data.map((e) {
                return Container(
                  color: Colors.grey,
                  width: double.maxFinite,
                  height: 1000,
                  child: Text('$e'),
                );
              }).toList(),
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
* */