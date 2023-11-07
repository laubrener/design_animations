import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        MainScroll(),
        Positioned(
          bottom: -10,
          right: 0,
          child: _ButtonNewList(),
        )
      ],
    ));
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        color: appTheme.darkTheme
            ? appTheme.currentTheme.indicatorColor
            : const Color(0xFFED6762),
        onPressed: () {},
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
        )),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem({
    required this.titulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      height: 130,
      decoration: BoxDecoration(
        color: appTheme.darkTheme ? Colors.grey : color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(
              color: appTheme.darkTheme ? Colors.grey : const Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color:
                    appTheme.darkTheme ? Colors.grey : const Color(0xffF7CDD5),
              ),
            ),
            Text(
              'List',
              style: TextStyle(
                color: appTheme.darkTheme
                    ? appTheme.currentTheme.indicatorColor
                    : const Color(0xffD93A30),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MainScroll extends StatelessWidget {
  final List items = const [
    _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    _ListItem(
      titulo: 'Subscriptions',
      color: Color(0xffF7CDD5),
    ),
    _ListItem(
      titulo: 'Books',
      color: Color(0xffFCEBAF),
    ),
    _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    _ListItem(
      titulo: 'Subscriptions',
      color: Color(0xffF7CDD5),
    ),
    _ListItem(
      titulo: 'Books',
      color: Color(0xffFCEBAF),
    ),
  ];

  const MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 200,
                maxHeight: 250,
                child: Container(
                  color: appTheme.scaffoldBackgroundColor,
                  child: const Titulo(),
                ))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(height: 100),
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
