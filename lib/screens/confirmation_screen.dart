import 'package:flutter/material.dart';
import 'package:lawyer_mobile/screens/navigator_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Appointment has been created.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your booked on appointment with John\n Mayson on sep 21 at 10:00 am",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        bottomNavigationBar: InkWell(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NavigatorScreen())),
          child: Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "Return to home",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
