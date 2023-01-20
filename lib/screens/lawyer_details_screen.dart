import 'package:flutter/material.dart';
import 'package:lawyer_mobile/screens/appointment_screen.dart';

class LawyerDetailsPage extends StatefulWidget {
  const LawyerDetailsPage({super.key});

  @override
  State<LawyerDetailsPage> createState() => _LawyerDetailsPageState();
}

class _LawyerDetailsPageState extends State<LawyerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Column(
              children: [
                AppBar(
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  title: Text("Lawyer Details"),
                  elevation: 0,
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade400),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white.withOpacity(0.9),
                            size: 30,
                          ),
                        ),
                        Text(
                          "150+",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Customers",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade400),
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.white.withOpacity(0.9),
                            size: 30,
                          ),
                        ),
                        Text(
                          "15 years",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Experience",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade400),
                          child: Icon(
                            Icons.star,
                            color: Colors.white.withOpacity(0.9),
                            size: 30,
                          ),
                        ),
                        Text(
                          "4.9",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rating",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "John Mayson",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Family Lawyer ",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                  ],
                ),
                Text("About Lawyer",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "John mayson is the top most family lawyer. \nHe achieved serval awards for his\nwonderful contribution in his own field. He is\navailable for private consultation.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Recent Comments",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("2 hour ago"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg="),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Great lawyer, hepled me a lot I would recommend him 10/10")
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30),
        height: 50,
        width: 500,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AppointmentScreen()));
          },
          child: Text("Get Appointment"),
        ),
      ),
    );
  }
}
