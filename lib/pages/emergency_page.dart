import 'package:design/widgets/boton_gordo.dart';
import 'package:design/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.personBurst,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.personBurst,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.personBurst,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
    ];
    List<FadeInLeft> itemMap = items
        .map((e) => FadeInLeft(
              duration: const Duration(milliseconds: 250),
              child: BotonGordo(
                icon: e.icon,
                texto: e.texto,
                color1: e.color1,
                color2: e.color2,
                onPressed: () => print('hola'),
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              const SizedBox(height: 80),
              ...itemMap,
            ]),
          ),
          const PageHeader()
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Medical Emergency',
          subTitulo: 'You´ve requested for',
        ),
        Positioned(
            right: 10,
            top: 40,
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
