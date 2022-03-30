import 'package:flutter/material.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/ui/global.dart';
import 'package:petfitproject/ui/screens/details.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class DoctorContainer extends StatelessWidget {
  final int id;

  const DoctorContainer({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(id: id),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 3)
        ], color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
        margin: const EdgeInsets.all(9.0),
        padding: const EdgeInsets.all(9.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 51,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: Image.network(
                  doctorInfo[id].image,
                ),
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    doctorInfo[id].name,
                    style: Styles.headerStyles,
                  ),
                  Text(
                    doctorInfo[id].type,
                    style: Styles.headerStyles,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: SmoothStarRating(
                          rating: doctorInfo[id].reviews,
                          size: 15,
                          color: MyColors.orange,
                        ),
                      ),
                      Text(
                        "(${doctorInfo[id].reviewCount})",
                        style: Styles.headerStyles,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Icon(Icons.bookmark_border),
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(9.0),
                    child: const Text(
                      "Open",
                      style: Styles.buttonStyles,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffdbf3e8),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
