import 'package:flutter/material.dart';
import 'package:lawyer_mobile/new_screens/myScaffold.dart';
import 'package:lawyer_mobile/screens/chat_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int selectedPage = 0;

  changeTab(int tab) async {
    selectedPage = tab;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      floatingActionButton: Container(),
      title: AppLocalizations.of(context)!.chats,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
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
                          AppLocalizations.of(context)!.active,
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
                        AppLocalizations.of(context)!.archive,
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
            ChatListItem(
                selectedPage: selectedPage,
                imageURL:
                    "https://www.777injury.com/wp-content/uploads/2019/01/injury-lawyer-walter-benenati.jpg",
                name: "Ali AlQattan",
                message:
                    "Hey, I have some ideas about it\nDownloaded a few image from",
                time: "Now",
                status: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
                statusColor: Colors.blue),
            SizedBox(
              height: 5,
            ),
            ChatListItem(
                selectedPage: selectedPage,
                imageURL:
                    "https://www.persofoto.com/images/vorher-nachher/passfoto-beispiel-nachher.jpg",
                name: "Sarah Turner",
                message:
                    "Good job mate! As long as\nyou're comfortable with it...",
                time: "1h",
                status: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
                statusColor: Colors.red),
          ],
        ),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String imageURL, name, message, time;
  final Widget status;
  final Color statusColor;
  final int selectedPage;
  const ChatListItem(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.message,
      required this.time,
      required this.status,
      required this.statusColor,
      required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyChatScreen(
                archived: selectedPage == 1,
              ))),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imageURL), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  message,
                  style: TextStyle(color: Colors.black45),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Container(
                padding: EdgeInsets.all(7),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: statusColor),
                child: status,
              )
            ],
          ),
        ],
      ),
    );
  }
}
