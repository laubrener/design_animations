import 'package:design/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        titulo: 'Asistencia médica',
        subTitulo: 'Haz solicitado',
      ),
    );
  }
}
