import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/appstyle.dart';

class PedDetailsView extends StatefulWidget {
  var data;

  PedDetailsView({Key? key, this.data}) : super(key: key);

  @override
  State<PedDetailsView> createState() => _PedDetailsViewState();
}

class _PedDetailsViewState extends State<PedDetailsView> {
  String? docPetname;
  String? docPetLocation;
  String? docPetid;
  String? docPetage;
  String? docpetAddress;
  String? docpetBreed;

  @override
  void initState() {
    var index = widget.data.toString();
    print(index);
    super.initState();
  }

  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:
              const Text("Pet Details", style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('petdetails').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var length = snapshot.data!.docs.length;
                for (int i = 0; i < length; i++) {
                  if (widget.data == i) {
                    DocumentSnapshot doc = snapshot.data!.docs[i];
                    docPetname = doc['petname'];
                    docPetLocation = doc['petlocation'];
                    docPetage = doc['petage'];
                    docPetid = doc['petid'];
                    // docPetid = doc['petid'];
                    docpetAddress = doc['Address'];
                    docpetBreed = doc['petbreed'];
                    textarea.text = docpetAddress!;
                    print(doc['petname'] + doc['petlocation']);
                  }
                }
              }
              return SingleChildScrollView(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LoginString.petName,
                            style: Styles.headerStyles,
                          )),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          docPetname!,
                          style: Styles.headerStyles,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(LoginString.petDob,
                              style: Styles.headerStyles)),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(docPetage!, style: Styles.headerStyles),
                      ),
                    )
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LoginString.PetLocation,
                            style: Styles.headerStyles,
                          )),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          docPetLocation!,
                          style: Styles.headerStyles,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LoginString.petBreed,
                            style: Styles.headerStyles,
                          )),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          docpetBreed!,
                          style: Styles.headerStyles,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LoginString.ownerContact,
                            style: Styles.headerStyles,
                          )),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          docPetid!,
                          style: Styles.headerStyles,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LoginString.ownerDetails,
                              style: Styles.headerStyles,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                      width: 350,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextField(
                          controller: textarea,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Owner details',
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LoginString.album,
                            style: Styles.headerStyles,
                          )),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/album.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LoginString.schedule,
                            style: Styles.headerStyles,
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/calender.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/views.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    )
                  ]),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text("Create"),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text("View"),
                      ),
                    )
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: Styles.style,
                          onPressed: () {
                            _launchCaller(context);
                          },
                          child: Text(LoginString.call),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ));
            }));
  }

  _launchCaller(BuildContext context) async {
    const number = '08592119XXXX'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
