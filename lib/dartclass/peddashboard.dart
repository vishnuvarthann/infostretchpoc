import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:petfitproject/commonclass/fontfamily.dart';

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
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}

getHomePageBody(BuildContext context) {
  List<String> images = [
    'assets/images/png-puppy-dog-dalmatian-puppy-1740.png',
    'assets/images/png-puppy-dog-dog-image-result-for-puppy-dog-png-500.png',
    'assets/images/png-puppy-dog-dog-png-image-246.png',
    'assets/images/png-puppy-dog-rottweiler-puppy-dog-nature-hundeportrait-isolated-552.png'
  ];
  return ListView.builder(
    itemCount: images.length,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext, index) {
      return Card(
        child: ListTile(
          leading: Image(image: AssetImage(images[index])),
          title: const Text(
            """PetName:""" +
                "" +
                '\n' +
                "PetAge:" +
                "" +
                '\n' +
                "Petlocation:" +
                "" +
                '\n' +
                "PetBreed:" +
                "" +
                '\n',
            style: TextStyle(
              fontFamily: FontFamily.robotoMono,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "/pedDetailView", arguments: null);
          },
        ),
      );
    },
  );
}
