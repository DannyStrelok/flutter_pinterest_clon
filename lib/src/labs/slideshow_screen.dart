import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/models/slider_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _SlidesIndicator()
            ],
          )
        ),
      ),
    );
  }
}

class _SlidesIndicator extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}


class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final PageController pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // print('pagina actual: ${pageViewController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        physics: BouncingScrollPhysics(),
        children: [
          _Slide('assets/svgs/slide_1.svg'),
          _Slide('assets/svgs/slide_2.svg'),
          _Slide('assets/svgs/slide_3.svg')
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  _Slide( this.svg );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: SvgPicture.asset(this.svg),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      decoration: BoxDecoration(
          color:  (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
                  ? Colors.blue : Colors.grey,
          shape: BoxShape.circle
      ),
    );
  }
}