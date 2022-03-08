// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/dartclass/ImageLoader.dart';

class addpet extends StatefulWidget {
  const addpet({Key? key}) : super(key: key);

  @override
  State<addpet> createState() => _addpetState();
}

class _addpetState extends State<addpet> {
  TextEditingController textarea = TextEditingController();
  final _myController1 = TextEditingController(text: '');
  final _myController2 = TextEditingController(text: '');
  final _myController3 = TextEditingController(text: '');
  final _myController4 = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding:
            MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 0, 20, 0)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Pet", style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.black54,
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
                    child: Text(LoginString.petName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    key: const Key('PetName'),
                    controller: _myController1,
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
                    child: Text(LoginString.petDob,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    key: const Key('Pet DOB'),
                    controller: _myController2,
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: TextFormField(
                    key: const Key('PetLocation'),
                    controller: _myController3,
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
                    child: Text(LoginString.petBreed,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: TextFormField(
                    key: const Key('PetBreed'),
                    controller: _myController4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pet Breed',
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ))),
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
                    controller: textarea,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Owner details',
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Row(children: [
              Flexible(
                flex: 2,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(HOME.addPetImage,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
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
                    child: Text(HOME.addPet),
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
      MaterialPageRoute(builder: (context) => const ImageLoader()),
    );
  }
}
