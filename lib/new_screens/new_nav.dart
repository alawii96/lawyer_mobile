import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/new_screens/chat_list.dart';
import 'package:lawyer_mobile/new_screens/home.dart';
import 'package:lawyer_mobile/new_screens/lawyers_list.dart';
import 'package:lawyer_mobile/new_screens/new_profile.dart';
import 'package:lawyer_mobile/screens/appointment_screen.dart';
import 'package:lawyer_mobile/screens/categories_screen.dart';
import 'package:lawyer_mobile/screens/chat_screen.dart';
import 'package:lawyer_mobile/screens/client_appointment_screen.dart';
import 'package:lawyer_mobile/screens/home_screen.dart';
import 'package:lawyer_mobile/screens/profile.dart';

class NewNavigatorScreen extends StatefulWidget {
  const NewNavigatorScreen({super.key});

  @override
  State<NewNavigatorScreen> createState() => _NewNavigatorScreenState();
}

class _NewNavigatorScreenState extends State<NewNavigatorScreen> {
  int selectedIndex = 0;
  Widget currentPage = NewHomePage();
  String selectedText = "Hello, Abdullah";
  @override
  Widget build(BuildContext context) {
    changeIndex(value) {
      switch (value) {
        case 0:
          currentPage = const NewHomePage();
          selectedText = "Hello, Abdullah";
          break;
        case 1:
          currentPage = ChatList();
          selectedText = "Chats";
          break;
        case 2:
          currentPage = ClientAppointmentScreen();
          selectedText = "Appintments";
          break;

        case 3:
          currentPage = NewProfilePage();
          selectedText = "Profile";
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
        // appBar: AppBar(
        //   leading: selectedIndex == 0
        //       ? Container(
        //           margin: EdgeInsets.only(left: 15),
        //           child: CircleAvatar(
        //             backgroundImage: NetworkImage(
        //                 "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg="),
        //           ),
        //         )
        //       : null,
        //   backgroundColor: Colors.grey.withOpacity(0.1),
        //   title: Text(
        //     selectedText,
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.notifications_outlined),
        //       color: Colors.black,
        //       onPressed: () {},
        //     ),
        //   ],
        //   elevation: 0,
        // ),
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
          elevation: 10,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black54),
          unselectedIconTheme: IconThemeData(color: Colors.black54),
          selectedIconTheme: IconThemeData(color: mainMaterialBlue),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: "Chats"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Appointments"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
