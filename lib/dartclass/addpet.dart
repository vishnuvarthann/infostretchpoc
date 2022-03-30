// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/dartclass/ImageFromGalleryEx.dart';

class addpet extends StatefulWidget {
  const addpet({Key? key}) : super(key: key);

  @override
  State<addpet> createState() => _addpetState();
}

class _addpetState extends State<addpet> {
  TextEditingController textarea = TextEditingController();
  final _myController1Petname = TextEditingController(text: '');
  final _myControllerPetAge = TextEditingController(text: '');
  final _myControllerpetloc = TextEditingController(text: '');
  final _myControllerpetBreed = TextEditingController(text: '');
  final _myControllerpetNumber = TextEditingController(text: '');
  final _myControllerpetowner = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.yellow),
        padding:
            MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 0, 20, 0)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)));

    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
          title: const Text("Add Pet", style: Styles.appheader),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            // Image.asset('assets/images/petfit.jpg', width: 50, height: 50),
            // const SizedBox(height: 40),
            Row(children: [
              Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(LoginString.petName, style: Styles.boldStyles)),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    key: const Key('PetName'),
                    controller: _myController1Petname,
                    style: Styles.headerStyles,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pet Name',
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(LoginString.petDob, style: Styles.boldStyles)),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    key: const Key('Pet DOB'),
                    controller: _myControllerPetAge,
                    style: Styles.headerStyles,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Date of Birth',
                    ),
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
                    child: Text(LoginString.PetLocation,
                        style: Styles.boldStyles)),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: TextFormField(
                    key: const Key('PetLocation'),
                    controller: _myControllerpetloc,
                    style: Styles.headerStyles,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pet Location',
                    ),
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
                    child:
                        Text(LoginString.petBreed, style: Styles.boldStyles)),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: TextFormField(
                    key: const Key('PetBreed'),
                    controller: _myControllerpetBreed,
                    style: Styles.headerStyles,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pet Breed',
                    ),
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
                    child: Text(LoginString.petNo, style: Styles.boldStyles)),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: TextFormField(
                    key: const Key('PhoneNumber'),
                    controller: _myControllerpetNumber,
                    style: Styles.headerStyles,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone number',
                    ),
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
                      child: Text(LoginString.ownerDetails,
                          style: Styles.boldStyles)),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
                width: 350,
                height: 150,
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
                    controller: _myControllerpetowner,
                    style: Styles.headerStyles,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'PetOwner details',
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Row(children: [
              Flexible(
                flex: 2,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(HOME.addPetImage, style: Styles.boldStyles)),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/camera.jpg',
                    width: 40,
                    height: 40,
                  ),
                ),
              )
            ]),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            Row(children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      _toggleFavorite(context);
                    },
                    child: Text(
                      HOME.addPet,
                      style: Styles.boldStyles,
                    ),
                  ),
                ),
              ),
            ]),
            Row(children: [
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      if (_myController1Petname.text == '' ||
                          _myControllerPetAge.text == '' ||
                          _myControllerpetloc.text == '' ||
                          _myControllerpetBreed.text == '' ||
                          _myControllerpetNumber.text == '' ||
                          _myControllerpetowner.text == '') {
                        showAlertDialog(context);
                      } else {
                        _petdetailsAdded(
                            context,
                            _myController1Petname.text,
                            _myControllerPetAge.text,
                            _myControllerpetloc.text,
                            _myControllerpetBreed.text,
                            _myControllerpetNumber.text,
                            _myControllerpetowner.text);
                      }
                    },
                    child: Text(
                      HOME.addPetDetails,
                      style: Styles.boldStyles,
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        )));
  }

  void _toggleFavorite(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ImageFromGalleryEx("Image from Gallery")),
    );
  }

  Future<void> _petdetailsAdded(
      BuildContext context,
      String? textN,
      String? textG,
      String? textL,
      String? textB,
      String? textP,
      String? textowner) async {
    FirebaseFirestore.instance.collection('petdetails').doc().set({
      'petname': textN,
      'petlocation': textL,
      'petid': "234",
      'petbreed': textB,
      'petage': textG,
      'image':
          "https://i.postimg.cc/Vvf8wsKj/png-puppy-dog-dog-image-result-for-puppy-dog-png-500.png",
      'Address': textowner,
    }, SetOptions(merge: true));
    showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text(
        "PLease fill the empty text",
        style: Styles.headerStyles,
      ),
      onPressed: () {},
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: Styles.headerStyles,
    ),
    onPressed: () {},
  );
}
