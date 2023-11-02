import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainScroll(),
        const Positioned(
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

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        color: const Color(0xFFED6762),
        onPressed: () {},
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
        )),
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  List<_ListItem> items = const [
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
  _ListaTareas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem({
    super.key,
    required this.titulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      height: 130,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
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
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text(
            'New',
            style: TextStyle(
              color: Color(0xff532128),
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
                color: const Color(0xffF7CDD5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xffD93A30),
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
  List items = const [
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
  MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 200,
                maxHeight: 250,
                child: Container(
                  color: Colors.white,
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
