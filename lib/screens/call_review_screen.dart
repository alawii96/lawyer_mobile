import 'package:flutter/material.dart';

class CallReviewScreen extends StatelessWidget {
  const CallReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(
                    "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Call Ended"),
              SizedBox(
                height: 10,
              ),
              Text(
                "John Mayson",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                height: 50,
                width: 500,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Write a review"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                color: Colors.white,
                height: 50,
                width: 500,
                child: Center(
                  child: Text(
                    "Go to Home",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
