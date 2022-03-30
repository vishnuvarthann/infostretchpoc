import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/commonclass/colors.dart';
import 'package:petfitproject/commonclass/dime.dart';
import 'package:petfitproject/commonclass/fontfamily.dart';
import 'package:petfitproject/dartclass/navigationdrawer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailAddress = TextEditingController();
  bool validate = false;
  late String email;
  late String password;
  bool _rememberMeFlag = false;

  @override
  void initState() {
    print("initstate");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      backgroundColor: AppColors.vheaderfont,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.1,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(HOME.loginPet, style: Styles.appheader),
      ),
      body: Center(
          child: SingleChildScrollView(
              padding: DimensionValue.edgeValue20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/images/petfit.jpg',
                        width: 100, height: 100),
                  ),
                  formSetup(context)
                ],
              ))),
    );
  }

  Widget formSetup(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            style: Styles.headerStyles,
            controller: _emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              border: const OutlineInputBorder(),
              hintText: LoginString.emailAddress,
              labelText: LoginString.emailAddress,
              suffixIcon: IconButton(
                iconSize: 18.0,
                onPressed: () => _emailAddress.clear(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            maxLength: 36,
            validator: (val) {
              if (val!.isEmpty) {
                return LoginString.emailerrormsg;
              } else {
                return null;
              }
            },
            onSaved: (val) => email = val!,
          ),
          const SizedBox(height: 20),
          TextFormField(
            style: Styles.headerStyles,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }),
              border: const OutlineInputBorder(),
              hintText: LoginString.password,
              labelText: LoginString.password,
            ),
            obscureText: _isObscure,
            validator: (val) {
              if (val!.isEmpty) {
                return LoginString.passerrormsg;
              } else if (val.length <= 8) {
                return LoginString.passlength;
              } else {
                return null;
              }
            },
            onSaved: (val) => password = val!,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: Text(
                  HOME.loginPet,
                  style: Styles.boldStyles,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    firestoreInstance
                        .collection("login")
                        .get()
                        .then((querySnapshot) {
                      querySnapshot.docs.forEach((result) {
                        if (email == "admin" && password == "admin@123") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationDrawer()),
                          );
                        }
                      });
                    });
                  }
                },
              )),
          const SizedBox(height: 20),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMeFlag,
                        onChanged: (value) => setState(() {
                          _rememberMeFlag = !_rememberMeFlag;
                        }),
                      ),
                      const Text(
                        "Remember me",
                        style: Styles.boldStyles,
                      ),
                    ],
                  ),
                  onTap: () => setState(() {
                    _rememberMeFlag = !_rememberMeFlag;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//   Widget getTodosWidget() {
//     return StreamBuilder<dynamic>(
//         stream: _bloc.baseserviceStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {}
//           return Container();
//         });
//   }
// }

}
