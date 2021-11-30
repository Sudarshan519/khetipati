import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentPage = 0;
  final List<Widget> _banners = List.generate(
    3,
    (index) => Image.asset(
      'assets/images/ad.png',
      fit: BoxFit.fill,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCarousel(),
        buildSizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (index) => buildDot(index: index),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.mainGreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  buildSizedBox() {
    return const SizedBox(
      height: 18,
    );
  }

  buildCarousel() {
    return SizedBox(
      height: getHeight(230),
      child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemCount: _banners.length,
          itemBuilder: (context, index) => Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(20.0),
                child: _banners[index],
              )),
    );
  }
}
