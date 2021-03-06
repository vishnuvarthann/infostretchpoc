import 'package:flutter/material.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/fontfamily.dart';

class SidebarList extends StatelessWidget {
  final Function pickedOption;
  const SidebarList({Key? key, required this.pickedOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            BottomNav.title,
            style: TextStyle(
              fontFamily: FontFamily.robotoMono,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
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
            _createOption('Appointment', Icons.meeting_room, Menu.appointment),
            const Divider(),
            _createOption('AppointmentHistory', Icons.meeting_room,
                Menu.appointmentHistory),
            const Divider(),
            _createOption('Live News', Icons.newspaper, Menu.livenewsreport),
            const Divider(),
            _createOption('Add Pet', Icons.art_track, Menu.addPet),
            const Divider(),
            _createOption("FeedBack", Icons.seventeen_mp, Menu.feedback),
            const Divider(),
            _createOption("Logout", Icons.exit_to_app, Menu.signOut),
            const Divider(color: Colors.black),
            const SizedBox(height: 20),
            _createOption("AppVersion 1.0.1", Icons.verified, Menu.appversion),
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
          fontFamily: FontFamily.robotoMono,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      onTap: () => pickedOption(menu),
    ));
  }
}

enum Menu {
  signOut,
  feedback,
  aboutUs,
  addPet,
  peddetails,
  detailpage,
  appointment,
  onlinepurchase,
  appointmentHistory,
  livenewsreport,
  appversion
}

enum Class { feedbackalert }
