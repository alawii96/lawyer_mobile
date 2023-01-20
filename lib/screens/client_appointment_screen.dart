import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:lawyer_mobile/screens/chat_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClientAppointmentScreen extends StatefulWidget {
  const ClientAppointmentScreen({super.key});

  @override
  State<ClientAppointmentScreen> createState() =>
      _ClientAppointmentScreenState();
}

class _ClientAppointmentScreenState extends State<ClientAppointmentScreen> {
  int selectedPage = 0;

  changeTab(int tab) async {
    selectedPage = tab;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      floatingActionButton: Container(),
      title: AppLocalizations.of(context)!.appointments,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          AppLocalizations.of(context)!.upcoming,
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
                        AppLocalizations.of(context)!.history,
                        style: TextStyle(
                            color:
                                selectedPage == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            selectedPage == 0
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            color: mainMaterialBlue,
                          ),
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.nextAppointment,
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Today, 10 PM - 11 PM",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Colors.white,
                          ),
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              //start

                              //end

                              SizedBox(
                                height: 75,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Ali",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "AlQattan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.info,
                                  size: 30,
                                  color: mainMaterialBlue,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            Divider(),
            Text(
              selectedPage == 0
                  ? AppLocalizations.of(context)!.upcomingAppointment
                  : AppLocalizations.of(context)!.previousAppointment,
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyChatScreen(
                        archived: selectedPage == 1,
                      ))),
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Image.network(
                          "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //start

                    //end

                    SizedBox(
                      height: 75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "John Mayson",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("31/01/2023 - 9 AM")
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.verified,
                        size: 30,
                        color: mainMaterialBlue,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
