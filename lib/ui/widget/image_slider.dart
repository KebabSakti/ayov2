import 'package:ayov2/getx/getx.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSlider extends StatelessWidget {
  final int itemCount;
  final Function itemBuilder;

  ImageSlider({
    @required this.itemCount,
    @required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ImageSliderController(),
      builder: (ImageSliderController controller) {
        return Stack(
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: double.infinity,
                autoPlay: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, _) {
                  controller.activeSlide(index);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Obx(
                  () {
                    return Row(
                      children: List<Widget>.generate(
                        itemCount,
                        (index) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (index == controller.activeSlide.value)
                                  ? Colors.red
                                  : Colors.grey[100],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Container(
            //       height: 20,
            //       width: 100,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         color: Colors.red.withOpacity(0.8),
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(15),
            //         ),
            //       ),
            //       child: Text(
            //         'Lihat Semua',
            //         textAlign: TextAlign.right,
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 10,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
