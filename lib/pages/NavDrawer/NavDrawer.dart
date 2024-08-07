import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String drawerImageUrl =
        "https://plus.unsplash.com/premium_photo-1665203537276-7b6aa3164730?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(drawerImageUrl),
                        fit: BoxFit.cover,
                        opacity: 0.3),
                  ),
                  accountEmail: Text(
                    '+91 7870780048',
                    style: GoogleFonts.poppins(),
                  ),
                  accountName: Text(
                    'Sumit Pandey',
                    style: GoogleFonts.poppins(),
                  ),
                  currentAccountPicture: ClipOval(
                    child: Image.network(
                      drawerImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Typicons.user_outline,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Profile',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    RpgAwesome.heavy_shield,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'AMC Details',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Typicons.cog_outline,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Settings',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.power_settings_new,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.teal,
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesome.whatsapp,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 7870780048',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesome.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 7870780048',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesome.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'support@caremother.in',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.teal,
                ),
                ListTile(
                  leading: const Icon(
                    Typicons.doc_text,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Terms & Conditions',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesome5.shield_alt,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Version 3.0.0",
              style: GoogleFonts.poppins(fontSize: 12),
            )),
          ),
        ],
      ),
    );
  }
}
