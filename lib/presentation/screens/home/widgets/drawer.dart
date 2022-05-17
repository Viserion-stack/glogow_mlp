// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../landing/landing_screen.dart';
import '../home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var userToDisplay = user?.displayName ?? '';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xff162222)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userToDisplay == null ? 'Name' : userToDisplay,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    userToDisplay == null ? 'Last name' : userToDisplay,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    user == null ? 'Email' : user.email.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTileItem(
            icon: const Icon(
              Icons.home_outlined,
              color: Color(0xFFFFA142),
              size: 30,
            ),
            text: 'Home',
            callback: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTileItem(
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFFFFA142),
              size: 30,
            ),
            text: 'My profile',
            callback: () {
              Navigator.of(context).pop();
              //Navigator.of(context).pushNamed(MyProfileScreen.routeName);
            },
          ),
          ListTileItem(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.grey,
              size: 30,
            ),
            text: 'About locket',
            callback: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushNamed(AboutLocket.routeName,
              //     arguments: 'https://locket.insure/about/');
            },
          ),
          ListTileItem(
            icon: const Icon(
              Icons.privacy_tip_outlined,
              size: 30,
              color: Colors.grey,
            ),
            text: 'Privacy Policy',
            callback: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushNamed(AboutLocket.routeName,
              //     arguments: 'https://locket.insure/privacy/');
            },
          ),
          ListTileItem(
            icon: const Icon(
              Icons.policy_outlined,
              color: Colors.grey,
              size: 30,
            ),
            text: 'Terms of Service',
            callback: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushNamed(AboutLocket.routeName,
              //     arguments: 'https://locket.insure/terms-of-service/');
            },
          ),
          ListTileItem(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.grey,
              size: 30,
            ),
            text: 'Help',
            callback: () {
              //Navigator.of(context).pushNamed(QuestionsScreen.routeName);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          ListTileItem(
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.grey,
              size: 30,
            ),
            text: 'Log Out',
            callback: () {
              Navigator.of(context)
                  .pushReplacementNamed(LandingScreen.routeName);
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.callback,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: callback,
      ),
    );
  }
}
