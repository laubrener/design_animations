import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatefulWidget {
  PinterestMenu({super.key});

  @override
  State<PinterestMenu> createState() => _PinterestMenuState();
}

class _PinterestMenuState extends State<PinterestMenu> {
  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print('pie chart');
        },
        icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print('search');
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print('notifications');
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print('supervise');
        },
        icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]),
        child: _MenuItems(menuItems: items),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) => _PinterestMenuButton(
                index: index,
                item: menuItems[index],
              )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(
      {super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
