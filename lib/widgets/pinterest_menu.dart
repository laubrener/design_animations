import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;

  final List<PinterestButton> items;

  PinterestMenu({
    required this.mostrar,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color.fromARGB(255, 71, 91, 100),
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  // final List<PinterestButton> items = [
  //   PinterestButton(
  //       onPressed: () {
  //         print('pie chart');
  //       },
  //       icon: Icons.pie_chart),
  //   PinterestButton(
  //       onPressed: () {
  //         print('search');
  //       },
  //       icon: Icons.search),
  //   PinterestButton(
  //       onPressed: () {
  //         print('notifications');
  //       },
  //       icon: Icons.notifications),
  //   PinterestButton(
  //       onPressed: () {
  //         print('supervise');
  //       },
  //       icon: Icons.supervised_user_circle),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        opacity: (mostrar) ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 10, spreadRadius: -5)
                ]),
            child: _MenuItems(
              menuItems: items,
              activeColor: activeColor!,
              inactiveColor: inactiveColor!,
            )),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  final Color activeColor;
  final Color inactiveColor;
  const _MenuItems(
      {super.key,
      required this.menuItems,
      required this.activeColor,
      required this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) => _PinterestMenuButton(
                index: index,
                item: menuItems[index],
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  final Color activeColor;
  final Color inactiveColor;
  const _PinterestMenuButton(
      {super.key,
      required this.index,
      required this.item,
      required this.activeColor,
      required this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: itemSeleccionado != index ? 25 : 35,
          color: itemSeleccionado != index ? inactiveColor : activeColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int i) {
    _itemSeleccionado = i;
    notifyListeners();
  }
}
