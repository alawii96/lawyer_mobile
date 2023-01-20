import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';
import 'package:lawyer_mobile/screens/calling_screen.dart';

class MyChatScreen extends StatefulWidget {
  final bool archived;

  const MyChatScreen({super.key, required this.archived});

  @override
  State<MyChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  TextEditingController _messageControlelr = TextEditingController();
  List<Message> messages = [
    Message(
        "Hello there Abdulla This is John Mayson Let me know how i can help",
        "1"),
    Message(
        "Hello there John I am having some difficulities and I need your help",
        "0")
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.1),
          appBar: AppBar(
            backgroundColor: mainMaterialBlue,
            shadowColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg="),
                ),
              ),
            ),
            title: Title(
                color: Colors.black,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Mayson",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                )),
            actions: [
              IconButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CallingPage()));
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: messages
                        .map((e) => Row(
                              mainAxisAlignment: e.userId == "0"
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: 50, maxWidth: 300),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: e.userId == "0"
                                            ? Radius.circular(10)
                                            : Radius.zero,
                                        bottomRight: e.userId == "1"
                                            ? Radius.circular(10)
                                            : Radius.zero,
                                      ),
                                      color: e.userId == "0"
                                          ? mainMaterialBlue.shade800
                                          : Colors.grey.shade300,
                                    ),
                                    child: Text(
                                      e.message,
                                      style: TextStyle(
                                          color: e.userId == "0"
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15),
                                    ),
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                ),
                widget.archived
                    ? Container(
                        child: Center(
                          child: Text(
                            "Please purchase a service to continue\nchatting with the lawyer",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: mainMaterialBlue),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainMaterialBlue),
                        child: TextFormField(
                          controller: _messageControlelr,
                          textInputAction: TextInputAction.send,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                              hintText: "\t\t\t\t\tType a message",
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: Container(
                                width: 70,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        messages.add(Message(
                                            _messageControlelr.text, "0"));
                                        _messageControlelr.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.attach_file,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              )),
                          onFieldSubmitted: (newValue) {
                            messages.add(Message(newValue, "0"));
                            _messageControlelr.clear();
                            setState(() {});
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Message {
  late String message;
  late String userId;

  Message(this.message, this.userId);
}
