import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff283a37),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          ListTile(
            title: Text(
              'Discover',
              style: TextStyle(color: Color(0xff449067)),
            ),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title:
                Text('Earn Points', style: TextStyle(color: Color(0xff449067))),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          ListTile(
            title: Text('Support', style: TextStyle(color: Color(0xff449067))),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          ListTile(
            title: Text('Add A Record',
                style: TextStyle(color: Color(0xff449067))),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          ListTile(
            title: Text('Account', style: TextStyle(color: Color(0xff449067))),
            onTap: () {
              // Handle item 2 tap
            },
          ),
        ],
      ),
    );
  }
}
