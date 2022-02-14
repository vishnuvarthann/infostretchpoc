import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/dartclass/aboutfragment.dart';
import 'package:petfitproject/dartclass/landingfragment.dart';
import 'package:petfitproject/dartclass/pedlandingscreen.dart';
import 'package:petfitproject/sideBar/sidebarlist.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


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
    const pedlandingscreen(),
    const Aboutfragment(),
  ];
  @override
  Widget build(BuildContext context) {
    //final taptitle = widget.taptitles[_currentIndex];
   // title = taptitle;
    return Scaffold(
      drawer: Drawer(
        child: SidebarList(
          pickedOption: _pickedOption,
        ),
      ),
      
      appBar: widget.neeAppBar ?AppBar(
        backgroundColor: Colors.black,
         iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(BottomNav.title ,style: TextStyle(
    color: Colors.white,
  ),),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.language_outlined),
          ),
        ],
      ):null,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
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
            label:BottomNav.trackservic,

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
            ),
            label:BottomNav.help,
          ),
        ],
      ),
    );
  }


  _pickedOption(menu) {
    Navigator.pop(context);
    switch (menu) {
      case Menu.peddetails:
        Navigator.pushNamed(context, '/petdetails',
            arguments: {'type': Menu.aboutUs});
        break;
      case Menu.aboutUs:
        Navigator.pushNamed(context, '/signOut',
            arguments: {'type': Menu.aboutUs});
        break;
      case Menu.addPet:
        Navigator.pushNamed(context, '/addpet', arguments: {'type': Menu.addPet});
        break;
      case Menu.signOut:
        Navigator.pushNamed(context, '/signOut',
            arguments: {'type': Menu.signOut});
        break;
      case Menu.feedback:
        Navigator.pushNamed(context, '/feedback',
            arguments: {'type': Menu.signOut});
        break;
    }
  }
}
