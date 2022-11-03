import 'package:flutter/material.dart';
import 'package:language/screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      // Largeur
      child: Container(
        color: Colors.black.withOpacity(.8),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Parameters',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.red,
                size: 30,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              )),
            ),
            const Divider(
              height: 20,
              thickness: 5,
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.bell,
                  color: Colors.red, size: 30),
              title: const Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }
}
