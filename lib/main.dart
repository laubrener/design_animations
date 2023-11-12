import 'package:design/models/layout_model.dart';
import 'package:design/pages/laucher_tablet_page.dart';
import 'package:flutter/material.dart';
import 'package:design/themes/theme.dart';
import 'package:design/pages/laucher_page.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       Provider(create: (_) => ThemeChanger(2)),
//       Provider(create: (_) => LayoutModel()),
//     ],
//     child: const MyApp(),
//   ));
// }
void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => LayoutModel(),
    child: ChangeNotifierProvider(
        create: (_) => ThemeChanger(2), child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientacion: $orientation');
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
