import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/contracts_list.dart';
import 'package:lawyer_mobile/new_screens/lawyers_list.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:lawyer_mobile/new_widgets/categories_list_item_horizontal.dart';
import 'package:lawyer_mobile/new_widgets/lawyer_horizontal.dart';
import 'package:lawyer_mobile/screens/categories_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'contract-fill.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
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
      floatingActionButton: Container(),
      title: AppLocalizations.of(context)!.home,
      child: Column(
        children: [
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

          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: mainMaterialYellow.withOpacity(0.3),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.offerTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        AppLocalizations.of(context)!.offerDesc,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ContractsList())),
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: mainMaterialBlue,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.offerButton,
                              style: TextStyle(
                                  color: mainMaterialBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/onboarding3.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (() => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesPage()))),
            child: Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: mainMaterialBlue,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.dashboard,
                    color: mainMaterialBlue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.mainButton0,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: mainMaterialBlue,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: mainMaterialBlue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.mainButton1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: mainMaterialBlue,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.request_page_outlined,
                  color: mainMaterialYellow.shade900,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.mainButton2,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            children: [
              Lawyer(
                stars: 1,
                name: "Ali AlQattan",
                imageURL:
                    "https://w7.pngwing.com/pngs/1008/506/png-transparent-lawyer-new-york-solicitor-organization-chairman-lawyer.png",
                message: AppLocalizations.of(context)!.availableNow,
              ),
              SizedBox(
                width: 05,
              ),
              Lawyer(
                stars: 5,
                name: "Reem Neama",
                circleColor: Colors.orange,
                message: AppLocalizations.of(context)!.freeConsultation,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
