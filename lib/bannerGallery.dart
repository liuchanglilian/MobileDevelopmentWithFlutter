import 'package:flutter/material.dart';
import 'post.dart';


class BannerGalleryWidget extends StatefulWidget {
  BannerGalleryWidget({Key key, this.record}) : super(key: key);
  final Post record;
  @override
  State<StatefulWidget> createState() {
    return BannerGalleryWidgetState();
  }
}

class BannerGalleryWidgetState extends State<BannerGalleryWidget> {
  final PageController controller = PageController();
  void _pageChanged(int index) {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            height: 300.0,
            child: Container(
              child: PageView.builder(
                onPageChanged: _pageChanged,
                controller: controller,
                itemBuilder: (context, index) {
                  return new Center(
                    child: Image.network(widget.record.pictures[index]),
                  );
                },
                itemCount: widget.record.pictures.length,
              ),
            )
        ),
        Indicator(
          controller: controller,
          itemCount: widget.record.pictures.length,
        ),
      ],
    );

  }
}

class Indicator extends StatelessWidget {
  Indicator({
    this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  final PageController controller;

  final int itemCount;

  final Color normalColor = Colors.indigo;

  final Color selectedColor = Colors.blue;

  final double size = 8.0;

  final double spacing = 4.0;

  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page.round() % pageCount : 0);

    return new Container(
      height: size,
      width: size + (2 * spacing),
      child: new Center(
        child: new Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}
