import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool indicatorPositionTop;
  final Color colorPrimary;
  final Color colorSecondary;
  final double bulletPrimary;
  final double bulletSecondary;

  Slideshow({
    @required this.slides,
    this.indicatorPositionTop = false,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey,
    this.bulletPrimary = 15,
    this.bulletSecondary = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(this.colorPrimary, this.colorSecondary, this.bulletPrimary, this.bulletSecondary),
      child: SafeArea(
        child: Center(
            child: Column(
              children: [
                if(this.indicatorPositionTop) _SlidesIndicator(this.slides.length > 0 ? this.slides.length : 0),
                Expanded(child: _Slides( this.slides )),
                if(!this.indicatorPositionTop) _SlidesIndicator(this.slides.length > 0 ? this.slides.length : 0),
              ],
            ),
        ),
      ),
    );
  }
}

class _SlidesIndicator extends StatelessWidget {

  final int slidesLength;

  _SlidesIndicator(this.slidesLength);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
        children: List.generate(slidesLength, (index) => _Dot(index)),
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

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
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page;
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
        // children: [
        //   _Slide('assets/svgs/slide_1.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide) ).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide( this.slide );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final slideshowModel = Provider.of<_SliderModel>(context);
    double size = 0;
    Color color;

    if(slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5) {
      size = slideshowModel.bulletPrimary;
      color = slideshowModel.colorPrimary;
    } else {
      size = slideshowModel.bulletSecondary;
      color = slideshowModel.colorSecondary;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      decoration: BoxDecoration(
          color:  color,
          shape: BoxShape.circle
      ),
    );
  }
}

class _SliderModel with ChangeNotifier {

  double _currentPage = 0;
  Color colorPrimary = Colors.blue;
  Color colorSecondary = Colors.grey;
  double bulletPrimary = 15;
  double bulletSecondary = 12;

  _SliderModel(this.colorPrimary, this.colorSecondary,
      this.bulletPrimary, this.bulletSecondary);

  double get currentPage => this._currentPage;

  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

}