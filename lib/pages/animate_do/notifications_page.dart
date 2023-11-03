import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notifications Page'),
          centerTitle: true,
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final model = Provider.of<_NotificationModel>(context, listen: false);
        int numero = model.numero;
        numero++;

        model.numero = numero;

        if (numero >= 2) {
          final controller = model.bounceController;
          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(
        FontAwesomeIcons.play,
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final int numero =
        Provider.of<_NotificationModel>(context, listen: false).numero;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          const BottomNavigationBarItem(
              label: 'Bones',
              icon: FaIcon(
                FontAwesomeIcons.bone,
              )),
          BottomNavigationBarItem(
              label: 'Notifications',
              icon: Stack(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.bell,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BounceInDown(
                      animate: numero > 0 ? true : false,
                      from: 10,
                      child: Bounce(
                        from: 10,
                        controller: (controller) =>
                            Provider.of<_NotificationModel>(context)
                                .bounceController = controller,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$numero',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          const BottomNavigationBarItem(
              label: 'My Dog',
              icon: FaIcon(
                FontAwesomeIcons.dog,
              )),
        ]);
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;
  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;
  set bounceController(AnimationController controller) {
    _bounceController = controller;
  }
}
