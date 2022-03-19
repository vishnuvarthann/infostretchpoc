import 'package:flutter/material.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/ui/global.dart';
import 'package:petfitproject/ui/widgets/bookingscreen.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class DetailsScreen extends StatefulWidget {
  final int id;

  const DetailsScreen({Key? key, required this.id}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _showMoreAbout = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, _) => Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: MediaQuery.of(context).size.height / 3,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(doctorInfo[widget.id].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DraggableScrollableSheet(
                  initialChildSize: 2 / 3,
                  minChildSize: 2 / 3,
                  maxChildSize: 1,
                  builder: (context, scrollController) => Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          offset: const Offset(0, -3),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${doctorInfo[widget.id].name}",
                                    style: Styles.headerStyles,
                                  ),
                                  Text(
                                    "${doctorInfo[widget.id].type}",
                                    style: Styles.headerStyles,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: MyColors.orange,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              decoration: BoxDecoration(
                                color: MyColors.darkGreen,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                              rating: doctorInfo[widget.id].reviews,
                              size: 25,
                              color: MyColors.orange,
                            ),
                            Text("(${doctorInfo[0].reviewCount} Reviews)",
                                style: Styles.headerStyles),
                            Expanded(
                              child: FlatButton(
                                child: const FittedBox(
                                  child: Text("See all reviews",
                                      style: Styles.headerStyles),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "About",
                          style: Styles.headerStyles,
                        ),
                        Wrap(
                          children: <Widget>[
                            Text(
                              "${doctorInfo[widget.id].about}",
                              maxLines: _showMoreAbout ? null : 1,
                              style: Styles.smallHit,
                            ),
                            FlatButton(
                              child: Text(
                                _showMoreAbout ? "See Less" : "See More",
                                style: Styles.smallHit,
                              ),
                              onPressed: () {
                                setState(() {
                                  _showMoreAbout = !_showMoreAbout;
                                });
                              },
                            )
                          ],
                        ),
                        const Text(
                          "Working Hours",
                          style: Styles.smallHit,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "${doctorInfo[widget.id].workingHours}",
                              style: Styles.smallHit,
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(9.0),
                                child: const Text(
                                  "Open",
                                  style: Styles.smallHit,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xffdbf3e8),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Stats", style: Styles.smallHit,
                          // style: Theme.of(context).textTheme.subtitle,
                        ),
                        const SizedBox(height: 11),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "${doctorInfo[widget.id].patientsCount}",
                                  style: Styles.smallHit,
                                ),
                                // style: Theme.of(context).textTheme.title),
                                const Text(
                                  "Patients",
                                  style: Styles.smallHit,
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "${doctorInfo[widget.id].experience} Years",
                                  style: Styles.smallHit,
                                ),
                                const Text(
                                  "Experience",
                                  style: Styles.smallHit,
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "${doctorInfo[widget.id].certifications}",
                                  style: Styles.smallHit,
                                ),
                                const Text(
                                  "Certifications",
                                  style: Styles.smallHit,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Colors.yellow,
                            child: const Text(
                              "Make An Appointement",
                              style: Styles.headerStyles,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BookingScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
