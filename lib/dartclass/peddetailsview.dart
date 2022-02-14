import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petfitproject/Utility/constants.dart';

// class SignOut extends StatelessWidget {
//   const SignOut({Key? key}) : super(key: key);
//
//    @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//             title: const Text("SignOut"),
//             ),
//         body: const Center(child: Text('SignOut')));
//   }
//
// }
class PedDetailsView extends StatefulWidget {
  const PedDetailsView({Key? key}) : super(key: key);

  @override
  State<PedDetailsView> createState() => _PedDetailsViewState();
}

class _PedDetailsViewState extends State<PedDetailsView> {
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 0, 20, 0)),
        textStyle:
        MaterialStateProperty.all(const TextStyle(fontSize:25)));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Pet Details",style: TextStyle(color: Colors.white)),
          leading:  IconButton(
            icon:  const Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () =>Navigator.pop(context),
          ),
          backgroundColor: Colors.black54,
        ),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width ,
          color: Colors.grey,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Image.asset('assets/images/petfit.jpg', width: 100, height: 100),
            const SizedBox(height: 40),
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
                  alignment: Alignment.centerLeft,
                  child: Text(LoginString.petName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(LoginString.petDob,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
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
                  child: Text(LoginString.PetLocation,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
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
                  child: Text(LoginString.petBreed,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
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
                    decoration: InputDecoration(
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
                    child: Text(LoginString.album,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/album.jpg',width:40 ,height:40 ,),
                ),
              )
            ]),
            const SizedBox(height: 20),
            Row(children: [
              Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(LoginString.schedule,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ))),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/calender.jpg',width:40 ,height:40 ,),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/views.jpg',width:40 ,height:40 ,),
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
                  child:  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child:  Text(LoginString.call),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child:  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child:  Text(LoginString.delete),
                  ),
                ),
              )
            ]),
          ]),
        )));
  }
}
