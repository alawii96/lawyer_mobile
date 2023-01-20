import 'package:flutter/material.dart';

import '../main.dart';

class LawyersReviews extends StatelessWidget {
  final int rating;
  const LawyersReviews({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "${rating.toDouble()}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 26,
                color: rating >= 1 ? mainMaterialYellow : Colors.grey.shade300,
              ),
              Icon(
                Icons.star,
                size: 26,
                color: rating >= 2 ? mainMaterialYellow : Colors.grey.shade300,
              ),
              Icon(
                Icons.star,
                size: 26,
                color: rating >= 3 ? mainMaterialYellow : Colors.grey.shade300,
              ),
              Icon(
                Icons.star,
                size: 26,
                color: rating >= 4 ? mainMaterialYellow : Colors.grey.shade300,
              ),
              Icon(
                Icons.star,
                size: 26,
                color: rating >= 5 ? mainMaterialYellow : Colors.grey.shade300,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Based on 34 reviews",
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          RatingStat(
            name: "Excellent",
            percentage: 0.9,
            color: mainMaterialBlue.shade900,
          ),
          RatingStat(
            name: "Good",
            percentage: 0.7,
            color: mainMaterialBlue.shade800,
          ),
          RatingStat(
            name: "Average",
            percentage: 0.5,
            color: mainMaterialBlue.shade700,
          ),
          RatingStat(
            name: "Below Average",
            percentage: 0.3,
            color: mainMaterialBlue.shade600,
          ),
          RatingStat(
            name: "Poor",
            percentage: 0.2,
            color: mainMaterialBlue.shade500,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            child: Text("A"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ali AlQattan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: mainMaterialYellow,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text("1 day ago")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "This app is really amazing and the lawyer helped me a lot",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingStat extends StatelessWidget {
  final String name;
  final Color color;
  final double percentage;
  const RatingStat(
      {super.key,
      required this.name,
      required this.color,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              name,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 7,
                width: 250,
                color: Colors.grey.shade300,
              ),
              Container(
                height: 7,
                width: percentage * 250,
                color: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
