import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_mobile/screens/appointment_screen.dart';
import 'package:lawyer_mobile/screens/categories_screen.dart';
import 'package:lawyer_mobile/screens/client_appointment_screen.dart';
import 'package:lawyer_mobile/screens/home_screen.dart';

import 'free_lawyers_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectedIndex = 0;
  Widget currentPage = HomePage();
  String selectedText = "Hello, Abdullah";
  @override
  Widget build(BuildContext context) {
    changeIndex(value) {
      switch (value) {
        case 0:
          currentPage = const HomePage();
          selectedText = "Hello, Abdullah";
          break;
        case 1:
          currentPage = const CategoriesPage();
          selectedText = "Categories";
          break;
        case 2:
          currentPage = const ClientAppointmentScreen();
          selectedText = "Appintments";
          break;
        default:
      }

      selectedIndex = value;

      setState(() {});
    }

    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('This action cannot be undone.'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: selectedIndex == 0
              ? Container(
                  margin: EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg="),
                  ),
                )
              : null,
          backgroundColor: Colors.grey.withOpacity(0.1),
          title: Text(
            selectedText,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
          elevation: 0,
        ),
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              changeIndex(value);
            });

            if (kDebugMode) {
              print(selectedText);
            }
          },
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Appointments"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
