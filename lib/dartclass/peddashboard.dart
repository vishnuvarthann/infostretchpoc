import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:petfitproject/commonclass/appstyle.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:petfitproject/dartclass/peddetailsview.dart';

class PedDashBoard extends StatefulWidget {
  const PedDashBoard({Key? key}) : super(key: key);

  @override
  _PedDashBoardState createState() => _PedDashBoardState();
}

class _PedDashBoardState extends State<PedDashBoard> {
  late CarouselSlider carouselSlider;

  final CarouselController _controller = CarouselController();

  List imageList = [
    'assets/images/png-puppy-dog-dalmatian-puppy-1740.png',
    'assets/images/png-puppy-dog-dog-image-result-for-puppy-dog-png-500.png',
    'assets/images/png-puppy-dog-dog-png-image-246.png',
    'assets/images/png-puppy-dog-rottweiler-puppy-dog-nature-hundeportrait-isolated-552.png',
  ];

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
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {});
              }),
          items: imageList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 20.0,
                    ),
                    elevation: 6.0,
                    shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            //margin: const EdgeInsets.all(10.0),
            child: getHomePageBody(context)),
      ],
    ));
  }
}

getHomePageBody(BuildContext context) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('petdetails').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              // return Text(doc['petname']);
              return Card(
                  child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: doc['image'],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                title: Text(
                    "Pet Name :" +
                        doc['petname'] +
                        "\n" +
                        "Petlocation :" +
                        doc['petlocation'] +
                        "\n" +
                        "PetBreed :" +
                        doc['petbreed'] +
                        "\n" +
                        "petAge :" +
                        doc['petage'] +
                        "\n" +
                        "petID :" +
                        doc['petid'],
                    style: Styles.headerStyles),

                // subtitle: Text("Pet location :" + doc['petlocation'],
                //     style: Styles.headerStyles),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PedDetailsView(
                              data: index,
                            )),
                  );
                },
              ));
            });
      });
}
