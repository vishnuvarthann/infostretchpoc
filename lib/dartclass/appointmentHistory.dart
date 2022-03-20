import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:petfitproject/commonclass/appstyle.dart';

// ignore: must_be_immutable
class AppointmentHistory extends StatefulWidget {
  const AppointmentHistory({
    Key? key,
  }) : super(key: key);

  @override
  State<AppointmentHistory> createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  var time;
  @override
  void initState() {
    super.initState();
  }

  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("AppointmentHistory ",
              style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('appointments details')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  leading: const Icon(Icons.document_scanner_rounded),
                  title: Text(
                    "Patient Name : " +
                        snapshot.data!.docs[index].get('name') +
                        "\n" +
                        "Doctor Name :" +
                        snapshot.data!.docs[index].get('doctor') +
                        "\n" +
                        "Des  :" +
                        snapshot.data!.docs[index].get('description'),
                    style: Styles.headerStyles,
                  ),
                  subtitle: Text(
                    "Doctor Number : " +
                        snapshot.data!.docs[index].get('phone'),
                    // "date" +
                    // snapshot.data!.docs[index].get("Date").toString(),
                    style: Styles.headerStyles,
                  ),
                ));
              },
            );
          },
        ));
  }

  Future<String> _timestamp(time) async {
    DateTime.parse(time.toDate().toString());
    DateTime currentPhoneDate = DateTime.now(); //DateTime

    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

    DateTime myDateTime = myTimeStamp.toDate(); //
    return myDateTime.toString();
  }
}
