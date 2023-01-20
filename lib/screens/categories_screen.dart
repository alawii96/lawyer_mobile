import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/lawyers_list.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:lawyer_mobile/screens/free_lawyers_screen.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> categoriesIcons = [
      Icons.family_restroom,
      Icons.landscape,
      Icons.local_police,
      Icons.people_alt,
      Icons.monetization_on,
      Icons.water,
      Icons.child_care,
      Icons.pattern
    ];
    List<String> categories = [
      "Family",
      "Property",
      "Criminal",
      "Civil",
      "Business",
      "Admiralty",
      "Juvenile",
      "Patent"
    ];

    List<String> categoriesAR = [
      "Family",
      "Property",
      "Criminal",
      "Civil",
      "Business",
      "Admiralty",
      "Juvenile",
      "Patent"
    ];

    return MyScaffold(
      title: "Categories",
      floatingActionButton: Container(),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.grey.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: "Search"),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            LawyersList(title: categories[index])));
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          categoriesIcons[index],
                          color: mainMaterialBlue,
                          size: 40,
                        ),
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                  ),
                ),
                itemCount: categories.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
