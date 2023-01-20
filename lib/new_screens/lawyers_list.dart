import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:lawyer_mobile/new_widgets/lawyer_grid.dart';
import 'package:lawyer_mobile/new_widgets/lawyer_horizontal.dart';

import '../new_widgets/categories_list_item_horizontal.dart';

class LawyersList extends StatefulWidget {
  final String title;
  const LawyersList({super.key, required this.title});

  @override
  State<LawyersList> createState() => _LawyersListState();
}

class _LawyersListState extends State<LawyersList> {
  int selectedIndex = 0;
  List<IconData> categoriesIcons = [
    Icons.dashboard,
    Icons.family_restroom,
    Icons.landscape,
    Icons.local_police,
    Icons.people_alt,
    Icons.monetization_on
  ];
  List<String> categories = [
    "All",
    "Family",
    "Property",
    "Criminal",
    "Civil",
    "Business"
  ];

  changeIndex(ind) {
    selectedIndex = ind;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "${widget.title} Lawyers",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 47.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: mainMaterialBlue),
                      color: Colors.white),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: mainMaterialBlue,
                          ),
                          border: InputBorder.none,
                          hintText: "Search"),
                    ),
                  )),
              // Container(
              //   height: 75,
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => InkWell(
              //       onTap: () => changeIndex(index),
              //       child: CategoryListItem(
              //         name: categories[index],
              //         icon: categoriesIcons[index],
              //         selected: index == selectedIndex ? true : false,
              //       ),
              //     ),
              //     itemCount: categories.length,
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                shrinkWrap: true,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(lawyersGridList.length, (index) {
                  return lawyersGridList[index];
                }),
              ),
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Categories 🔠",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 25,
          //       ),
          //     ),
          // Container(
          //   height: 75,
          //   margin: EdgeInsets.symmetric(vertical: 10),
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) => InkWell(
          //       onTap: () => changeIndex(index),
          //       child: CategoryListItem(
          //         name: categories[index],
          //         icon: categoriesIcons[index],
          //         selected: index == selectedIndex ? true : false,
          //       ),
          //     ),
          //     itemCount: categories.length,
          //   ),
          // ),
          //     Divider(),
          //     Text(
          //       "Available Right Now  ⭕",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 25,
          //       ),
          //     ),
          //     Divider(),
          //     SizedBox(
          //       height: 160,
          //       child: ListView(
          //         scrollDirection: Axis.horizontal,
          //         children: [
          // Lawyer(
          //   name: "Someone Oliver",
          //   stars: 1,
          //   imageURL:
          //       "https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg",
          // ),
          //         ],
          //       ),
          //     ),
          //     Divider(),
          //     Text(
          //       "Popular 🔥",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 25,
          //       ),
          //     ),
          //     Divider(),
          //     SizedBox(
          //       height: 160,
          //       child: ListView(
          //         scrollDirection: Axis.horizontal,
          //         children: [
          // Lawyer(
          //   name: "Ali AlQattan",
          //   stars: 5,
          //   imageURL:
          //       "https://www.777injury.com/wp-content/uploads/2019/01/injury-lawyer-walter-benenati.jpg",
          // ),
          // Lawyer(
          //   name: "Oliver Wasten",
          //   stars: 5,
          //   category: "Pornhub",
          //   imageURL:
          //       "https://abovethelaw.com/uploads/2014/03/cleavage-lawyer.jpg",
          // ),
          //         ],
          //       ),
          //     ),
          //     Divider(),
          //     Text(
          //       "Booked in the last 24h 🕛",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 25,
          //       ),
          //     ),
          //     Divider(),
          //     SizedBox(
          //       height: 160,
          //       child: ListView(
          //         scrollDirection: Axis.horizontal,
          //         children: [
          //           Lawyer(name: "Ali AlQattan", stars: 6),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
      floatingActionButton: Container(),
    );
  }
}
