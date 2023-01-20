import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';

import '../new_screens/lawyer_details.dart';

class Lawyer extends StatelessWidget {
  final String name;
  final String category;
  final int stars;
  final String imageURL;
  final bool premium;
  final String message;
  final Color circleColor;
  const Lawyer(
      {super.key,
      required this.name,
      required this.stars,
      this.category = "Family",
      this.imageURL =
          "https://s3-prod.crainsnewyork.com/styles/width_253/s3/Marcantonio%20Stephanie%20HS.jpg",
      this.premium = false,
      this.message = "Available now",
      this.circleColor = Colors.green});

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
      child: Container(
        width: 175,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          imageURL,
                        ),
                        fit: BoxFit.cover))),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              "Family Lawyer",
              style: TextStyle(color: Colors.black54),
            ),
            Divider(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: circleColor,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  message,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),

      // Padding(
      //   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      //   child: Material(
      //     elevation: 1.5,
      //     child: Container(
      //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      //       width: 120,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SizedBox(
      //             height: 100,
      //             width: 120,
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.only(
      //                   topRight: Radius.circular(15),
      //                   topLeft: Radius.circular(15)),
      //               child: Image.network(
      //                 imageURL,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(5.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Text(
      //                   name,
      //                   style: TextStyle(
      //                       fontSize: 14, fontWeight: FontWeight.bold),
      //                 ),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       category,
      //                       style: TextStyle(
      //                           fontSize: 12, color: mainMaterialBlue),
      //                     ),
      //                     Row(
      //                         children: List.generate(
      //                       stars,
      //                       (index) => Icon(
      //                         Icons.star,
      //                         color: mainMaterialYellow,
      //                         size: 10,
      //                       ),
      //                     )),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
