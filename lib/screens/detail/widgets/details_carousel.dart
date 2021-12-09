import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

class DetailsCarousel extends StatefulWidget {
  const DetailsCarousel({Key? key}) : super(key: key);

  @override
  _DetailsCarouselState createState() => _DetailsCarouselState();
}

class _DetailsCarouselState extends State<DetailsCarousel> {
  int currentPage = 0;
  final List<Widget> _banners = List.generate(
    3,
    (index) => Image.asset(
      'assets/images/items/melons.png',
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
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColors.mainGreen
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  buildSizedBox() {
    return const SizedBox(
      height: 11,
    );
  }

  buildCarousel() {
    return SizedBox(
      height: getHeight(219),
      width: getWidth(282),
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemCount: _banners.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: getWidth(30)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                        // width: getWidth(282),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/items/melons.png",
                                ),
                                fit: BoxFit.contain))),

                    // Image.asset(
                    //   'assets/images/ad.png',
                    //   width: double.infinity,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: getWidth(20)),
                    //   child: ClipRRect(
                    // borderRadius: const BorderRadius.only(
                    //     topLeft: Radius.circular(70),
                    //     bottomLeft: Radius.circular(60)),
                    //       child: _banners[index]),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),

        //  Container(
        //       decoration:
        //           BoxDecoration(borderRadius: BorderRadius.circular(30)),
        //       padding: const EdgeInsets.all(20.0),
        //       child: _banners[index],
        //     )
      ),
    );
  }
}
