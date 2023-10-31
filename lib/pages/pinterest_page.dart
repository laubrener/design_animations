import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PinterestMenu(),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  final List items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    // return MasonryGridView.count(
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 4,
    //   crossAxisSpacing: 4,
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       children: [
    //         _PinterestItem(
    //           index: index,
    //         )
    //       ],
    //     );
    //   },
    // );

    return GridView.builder(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
      ),
      itemBuilder: (context, index) => _PinterestItem(index: index),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.blue,
        ),
        child: Center(
            child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text("$index"),
        )));
  }
}
