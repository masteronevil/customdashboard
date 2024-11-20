import 'package:flutter/material.dart';

import 'customdashboard.dart';

class DefaultSideBar extends StatelessWidget {
  const DefaultSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero)),
      backgroundColor: Colors.blue.shade700,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Customdashboard.setScreen(const Center(
                child: Text('Home'),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Customdashboard.setScreen(const Center(
                child: Text('Settings'),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Colors.white),
            title: const Text('Contact', style: TextStyle(color: Colors.white)),
            onTap: () {
              Customdashboard.setScreen(const Center(
                child: Text('Contact'),
              ));
            },
          ),
        ],
      ),
    );
  }
}
