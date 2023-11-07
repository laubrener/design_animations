import 'package:design/pages/emergency_page.dart';
import 'package:design/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:design/pages/animate_do/pagina1.dart';
import 'package:design/pages/sliver_list_page.dart';
import 'package:design/pages/pinterest_page.dart';
import 'package:design/pages/graficas_circulares_page.dart';
import 'package:design/challenges/cuadrado_animado.dart';
import 'package:design/widgets/headers.dart';

final pageRoutes = [
  Route(
      icon: FontAwesomeIcons.slideshare,
      titulo: 'Slideshow',
      page: const SlideshowPage()),
  Route(
      icon: FontAwesomeIcons.truckMedical,
      titulo: 'Emergencia',
      page: const EmergencyPage()),
  Route(
      icon: FontAwesomeIcons.heading,
      titulo: 'Encabezados',
      page: const HeadersPage()),
  Route(
      icon: FontAwesomeIcons.peopleCarryBox,
      titulo: 'Cuadrado Animado',
      page: const CuadradoAnimadoPage()),
  Route(
      icon: FontAwesomeIcons.circleNotch,
      titulo: 'Barra Progreso',
      page: const GraficasCircularesPage()),
  Route(
      icon: FontAwesomeIcons.pinterest,
      titulo: 'Pinterest',
      page: PinterestPage()),
  Route(
      icon: FontAwesomeIcons.mobile,
      titulo: 'Slivers',
      page: const SliverListPage()),
  Route(
      icon: FontAwesomeIcons.masksTheater,
      titulo: 'Animate Do',
      page: const Pagina1Page()),
];

class Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  Route({required this.icon, required this.titulo, required this.page});
}
