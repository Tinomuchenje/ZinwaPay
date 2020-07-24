import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(accountName: Text("meterNumber"), accountEmail: Text("tino@gmail.com")),
        _createDrawerMenuOption(
          icon: Icons.home,
          text: 'Dashboard',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        _createDrawerMenuOption(
          icon: Icons.book,
          text: 'Account Details',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        _createDrawerMenuOption(
          icon: Icons.notifications_active,
          text: 'Notification History',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        _createDrawerMenuOption(
          icon: Icons.location_on,
          text: 'Location Services',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        _createDrawerMenuOption(
          icon: Icons.contact_phone,
          text: 'Contact Zinwa',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        _createDrawerMenuOption(
          icon: Icons.lock_open,
          text: 'Reset Password',
          onTap: () => Navigator.of(context).pop(),
        ),
      ]),
    );
  }

  Widget _createDrawerMenuOption({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        text,
        style: TextStyle(color: Colors.blue),
      ),
      onTap: onTap,
    );
  }
}
