import 'package:flutter/material.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/fontfamily.dart';
import 'package:petfitproject/dartclass/peddashboard.dart';
import 'package:petfitproject/dartclass/aboutfragment.dart';
import 'package:petfitproject/dartclass/landingfragment.dart';

import 'package:petfitproject/sideBar/sidebarlist.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class NavigationDrawer extends StatefulWidget {
  bool neeAppBar = true;
  final List<String> taptitles = [
    BottomNav.help,
    BottomNav.title,
    BottomNav.trackservic
  ];

  NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget container = const LandingFragment();
  final int _currentIndex = 0;
  // String title = "";

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: false,
    descStyle: const TextStyle(fontWeight: FontWeight.bold),
    animationDuration: const Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: const BorderSide(
        color: Colors.white70,
      ),
    ),
    titleStyle: const TextStyle(
      color: Colors.yellowAccent,
    ),
  );

  final List<Widget> _children = [
    const PedDashBoard(),
    const Aboutfragment(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SidebarList(
          pickedOption: _pickedOption,
        ),
      ),
      appBar: widget.neeAppBar
          ? AppBar(
              elevation: 0.1,
              backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                BottomNav.title,
                style: TextStyle(
                  fontFamily: FontFamily.robotoMono,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                // style: TextStyle(
                //   color: Colors.white,
                // ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.notification_add,
                    color: Colors.yellow,
                  ),
                ),
              ],
            )
          : null,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.1,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: null,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: BottomNav.trackservic,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
            ),
            label: BottomNav.help,
          ),
        ],
      ),
    );
  }

  _pickedOption(menu) {
    Navigator.pop(context);
    switch (menu) {
      case Menu.appointment:
        Navigator.pushNamed(context, '/OnBoardingScreen',
            arguments: {'type': Menu.appointment});
        break;
      case Menu.detailpage:
        Navigator.pushNamed(context, '/detailpage',
            arguments: {'type': Menu.detailpage});
        break;
      case Menu.appointmentHistory:
        Navigator.pushNamed(context, '/appointmenthistory',
            arguments: {'type': Menu.appointmentHistory});
        break;
      case Menu.livenewsreport:
        Navigator.pushNamed(context, '/bloc_base',
            arguments: {'type': Menu.livenewsreport});
        break;
      case Menu.addPet:
        Navigator.pushNamed(context, '/addpet',
            arguments: {'type': Menu.addPet});
        break;
      case Menu.signOut:
        Navigator.pushNamed(context, '/sigout',
            arguments: {'type': Menu.signOut});
        break;
      case Menu.feedback:
        Navigator.pushNamed(context, '/feedback',
            arguments: {'type': Menu.signOut});
        break;
    }
  }
}
