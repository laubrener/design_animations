import 'package:design/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:design/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños de Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: const _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
              color: appTheme.primaryColorLight,
            ),
        itemCount: pageRoutes.length,
        itemBuilder: (context, i) => ListTile(
              leading: FaIcon(
                pageRoutes[i].icon,
                color: appTheme.indicatorColor,
              ),
              title: Text(pageRoutes[i].titulo),
              trailing: Icon(
                Icons.chevron_right,
                color: appTheme.indicatorColor,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => pageRoutes[i].page));
              },
            ));
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final indicatorColor = appTheme.currentTheme.indicatorColor;
    return Drawer(
      child: Container(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            child: SafeArea(
              child: CircleAvatar(
                backgroundColor: indicatorColor,
                child: const Text(
                  'LB',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(
            child: _ListaOpciones(),
          ),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: indicatorColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: indicatorColor,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: indicatorColor,
            ),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: indicatorColor,
                onChanged: (value) => appTheme.customTheme = value),
          )
        ]),
      ),
    );
  }
}
