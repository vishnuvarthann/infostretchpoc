import 'package:flutter/material.dart';

import 'package:petfitproject/Utility/constants.dart';

class Aboutfragment extends StatefulWidget {
  const Aboutfragment({Key? key}) : super(key: key);

  @override
  AboutFragmentState createState() => AboutFragmentState();
}

TabController? _tabController;

class AboutFragmentState extends State<Aboutfragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: const Text(
                BottomNav.title,
              ),
            ),
            body: DefaultTabController(
                length: 3,
                child: Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: <Widget>[
                        PreferredSize(
                          preferredSize: const Size.fromHeight(50.0),
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.yellow,
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.grey,

                            tabs: const [
                              Tab(
                                text: 'ContactUs',
                                icon: Icon(Icons.contact_mail),
                              ),
                              Tab(
                                text: 'Location',
                                icon: Icon(Icons.location_on),
                              ),
                              Tab(
                                text: 'Photo',
                                icon: Icon(Icons.photo_album),
                              ),
                            ], // list of tabs
                          ),
                        ),
                        //TabBarView(children: [ImageList(),])
                        Expanded(
                          child: TabBarView(children: [
                            Container(),
                            Container(),
                            Container(
                              color: Colors.white,
                              child: const Center(child: Text("Photo details")),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
