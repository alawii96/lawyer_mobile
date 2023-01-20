import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';

import '../new_screens/lawyer_details.dart';

class LawyerGrid extends StatelessWidget {
  final String name;
  final String category;
  final int stars;
  final String imageURL;
  final bool premium;
  const LawyerGrid(
      {super.key,
      required this.name,
      required this.stars,
      this.category = "Family",
      this.imageURL =
          "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=",
      this.premium = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewLawyerDetailsPage(
                name: name,
                imageURL: imageURL,
                rating: stars,
                category: category,
                premium: premium,
              ))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Material(
          elevation: 1.5,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          premium
                              ? Icon(
                                  Icons.verified,
                                  color: mainMaterialBlue,
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          children: List.generate(
                        stars,
                        (index) => Icon(
                          Icons.star,
                          color: mainMaterialYellow,
                          size: 14,
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
