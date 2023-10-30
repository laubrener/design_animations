import 'package:design/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  const Slideshow({
    super.key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = const Color(0xffFF5A7E),
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Column(
          children: [
            if (puntosArriba)
              _Dots(
                totalSlides: slides.length,
                colorPrimario: colorPrimario!,
                colorSecundario: colorSecundario!,
                bulletPrimario: bulletPrimario,
                bulletSecundario: bulletSecundario,
              ),
            Expanded(
              child: _Slides(
                slides: slides,
              ),
            ),
            if (!puntosArriba)
              _Dots(
                totalSlides: slides.length,
                colorPrimario: colorPrimario!,
                colorSecundario: colorSecundario!,
                bulletPrimario: bulletPrimario,
                bulletSecundario: bulletSecundario,
              ),
          ],
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({super.key, required this.slides});
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      //  Actualizar el provider sliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page ?? 0;
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
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({
    super.key,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: slide);
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  const _Dots(
      {super.key,
      required this.totalSlides,
      required this.colorPrimario,
      required this.colorSecundario,
      required this.bulletPrimario,
      required this.bulletSecundario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (index) => _Dot(
                  index: index,
                  colorPrimario: colorPrimario,
                  colorSecundario: colorSecundario,
                  bulletPrimario: bulletPrimario,
                  bulletSecundario: bulletSecundario,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  const _Dot({
    super.key,
    required this.index,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.bulletPrimario,
    required this.bulletSecundario,
  });

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    double size;
    Color color;

    if (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) {
      size = bulletPrimario;
      color = colorPrimario;
    } else {
      size = bulletSecundario;
      color = colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
