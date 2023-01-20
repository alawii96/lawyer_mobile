import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';

import 'lawyer_reviews.dart';
import 'lawyer_services.dart';

class NewLawyerDetailsPage extends StatefulWidget {
  final String name, imageURL, category;
  final int rating;
  final bool premium;
  const NewLawyerDetailsPage(
      {super.key,
      required this.name,
      required this.imageURL,
      required this.category,
      required this.rating,
      required this.premium});

  @override
  State<NewLawyerDetailsPage> createState() => _NewLawyerDetailsPageState();
}

class _NewLawyerDetailsPageState extends State<NewLawyerDetailsPage> {
  int selectedPage = 0;
  bool _visibile = true;
  changeTab(int tab) async {
    selectedPage = tab;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      floatingActionButton: Container(),
      title: "Lawyer Profile",
      child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 110,
                      width: 110,
                      child: Image.network(
                        widget.imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 145,
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.verified,
                      size: 30,
                      color: mainMaterialBlue,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Text(
                widget.category + " Lawyer",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Text(
                "Only lawyers and painters can turn white to black.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => changeTab(0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: 50,
                      width: selectedPage == 0 ? 240 : 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedPage == 0
                              ? mainMaterialBlue
                              : Colors.grey.shade300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Services",
                            style: TextStyle(
                                color: selectedPage == 0
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => changeTab(1),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: 50,
                      width: selectedPage == 1 ? 240 : 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedPage == 1
                              ? mainMaterialBlue
                              : Colors.grey.shade300),
                      child: Center(
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                              color: selectedPage == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           selectedPage = 0;
              //           setState(() {});
              //         },
              //         child: Container(
              //           child: Center(
              //             child: Text(
              //               "Services",
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: selectedPage == 0
              //                       ? FontWeight.bold
              //                       : FontWeight.normal),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: 20,
              //       width: 1,
              //       color: Colors.black,
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           selectedPage = 1;
              //           setState(() {});
              //         },
              //         child: Container(
              //           child: Center(
              //             child: Text(
              //               "Reviews",
              //               style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: selectedPage == 1
              //                       ? FontWeight.bold
              //                       : FontWeight.normal),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 5),
              //   padding: EdgeInsets.only(bottom: 5),
              //   height: 0.2,
              //   width: double.infinity,
              //   color: Colors.black54,
              // ),
              AnimatedOpacity(
                  opacity: _visibile ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  child: selectedPage == 0
                      ? LawyerServices()
                      : LawyersReviews(rating: widget.rating))
            ],
          ),
        ),
      ),
    );
  }
}
