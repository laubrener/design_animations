import 'package:design/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
        backgroundColor: appTheme.indicatorColor,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(porcentaje: porcentaje),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.2,
                color: Colors.blue,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje * 1.4,
                color: Colors.purple,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.6,
                color: Colors.amber,
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    this.color = Colors.pink,
  });

  final double porcentaje;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        color: color,
        grosorSecundario: 10,
        colorSecundario: appTheme.textTheme.bodyLarge?.color,
      ),
    );
  }
}
