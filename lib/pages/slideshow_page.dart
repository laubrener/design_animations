import 'package:design/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    const children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow()),
    ];
    return Scaffold(
        body: isLarge
            ? const Column(children: children)
            : const Row(
                children: children,
              ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Slideshow(
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
      colorPrimario: appTheme.darkTheme
          ? appTheme.currentTheme.indicatorColor
          : const Color(0xffFF5A7E),
      bulletPrimario: 17,
    );
  }
}
