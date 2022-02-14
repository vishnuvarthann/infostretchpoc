import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                            Container(
                              
                            ),
                            Container(
                             
                              ),
                            
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

  // Future<bool> _onBackPressed() {
  //   return showDialog(
  //         context: context,
  //         builder: (context) => new AlertDialog(
  //           title: new Text('Are you sure?'),
  //           content: new Text('Do you want to exit an App'),
  //           actions: <Widget>[
  //             new GestureDetector(
  //               onTap: () => Navigator.of(context).pop(false),
  //               child: Text("NO"),
  //             ),
  //             SizedBox(height: 16),
  //             new GestureDetector(
  //               onTap: () => Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => NavigationDrawer()),
  //                   ModalRoute.withName("/NavigationDrawer")),
  //               child: Text("YES"),
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }
}
