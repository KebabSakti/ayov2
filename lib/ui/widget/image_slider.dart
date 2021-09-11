import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final int itemCount;
  final Function itemBuilder;
  final List<Widget> items;

  ImageSlider({
    this.itemCount,
    this.itemBuilder,
    this.items,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          items: widget.items,
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: double.infinity,
            autoPlay: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, _) {
              setState(() {
                active = index;
              });
            },
          ),
        ),
        // CarouselSlider.builder(
        //   itemCount: widget.itemCount,
        //   itemBuilder: widget.itemBuilder,
        //   options: CarouselOptions(
        //     viewportFraction: 1.0,
        //     height: double.infinity,
        //     autoPlay: true,
        //     enableInfiniteScroll: true,
        //     onPageChanged: (index, _) {
        //       setState(() {
        //         active = index;
        //       });
        //     },
        //   ),
        // ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: List<Widget>.generate(
                widget.items.length,
                (index) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (index == active) ? Colors.red : Colors.grey[100],
                    ),
                  );
                },
              ),
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
  }
}
