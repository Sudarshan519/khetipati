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
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getHeight(30),
        ),
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
        color: currentPage == index ? AppColors.textGreen : Color(0xFFD8D8D8),
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
      height: getHeight(145),
      width: getWidth(355),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30% OFF",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                      Text(
                        "on all veggies",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      Text('Grab all the offer \nbefore its gone')
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColors.mainGreen,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              bottomLeft: Radius.circular(65),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(70),
                                bottomLeft: Radius.circular(60)),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/ad.png",
                                ),
                                fit: BoxFit.fill))),

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
