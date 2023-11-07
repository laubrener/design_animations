import 'package:animate_do/animate_do.dart';
import 'package:design/pages/animate_do/notifications_page.dart';
import 'package:design/pages/animate_do/twitter_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../themes/theme.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
            delay: const Duration(milliseconds: 500),
            child: const Text('Animate Do')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const TwitterPage()),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Pagina1Page()),
              );
            },
            icon: SlideInLeft(
              from: 40,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          backgroundColor: appTheme.currentTheme.indicatorColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const NotificationsPage()),
            );
          },
          child: const FaIcon(
            FontAwesomeIcons.play,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: appTheme.darkTheme
                    ? appTheme.currentTheme.indicatorColor
                    : Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text(
                'Título',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                'Soy un texto pequeño',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: appTheme.darkTheme
                    ? appTheme.currentTheme.indicatorColor
                    : Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
