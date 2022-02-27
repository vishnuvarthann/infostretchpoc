import 'package:flutter/material.dart';
import 'package:petfitproject/Utility/constants.dart';

class SidebarList extends StatelessWidget {
  final Function pickedOption;
  const SidebarList({Key? key, required this.pickedOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(BottomNav.title),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.none),
                color: Colors.white,
              ),
            ),
            _createOption('Details Page', Icons.details, Menu.detailpage),
            const Divider(),
            _createOption('Add Pet', Icons.art_track, Menu.addPet),
            const Divider(),
            _createOption("FeedBack", Icons.seventeen_mp, Menu.feedback),
            const Divider(),
            _createOption("Logout", Icons.exit_to_app, Menu.signOut),
            const Divider(),
          ],
        ));
  }

  _createOption(String title, IconData image, Menu menu) {
    return GestureDetector(
        child: ListTile(
      dense: true,
      leading: Icon(image, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
      onTap: () => pickedOption(menu),
    ));
  }
}

enum Menu { signOut, feedback, aboutUs, addPet, peddetails, detailpage }

enum Class { feedbackalert }
