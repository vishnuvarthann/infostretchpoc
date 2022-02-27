import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:petfitproject/dartclass/feedback.dart';

class Signout extends StatelessWidget {
  const Signout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = Padding(
      padding: const EdgeInsets.all(20),
      child: Hero(
          tag: 'logo',
          child: SizedBox(
            height: 160,
            child: Image.asset('assets/images/petimages6.png'),
          )),
    );
    final description = Padding(
      padding: const EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: const TextSpan(
            text:
                'Thank for using this app . Please update you feedback to get anu issues ',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
    final buttonLogout = FlatButton(
        child: const Text(
          'Logout',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {
          _onBackPressed(context);
        });
    final feedbackLink = FlatButton(
        child: const Text(
          'FeedBack',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {});
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[avatar, description, buttonLogout, feedbackLink],
        ),
      ),
    ));
  }
}

Object _onBackPressed(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to exit an App'),
      actions: <Widget>[
        GestureDetector(
          onTap: () => Navigator.of(context).pop(false),
          child: const Text("NO"),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => SystemNavigator.pop(),
          child: const Text("YES"),
        ),
      ],
    ),
  );
}
