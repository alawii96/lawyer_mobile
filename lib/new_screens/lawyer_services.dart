import 'package:flutter/material.dart';

import '../main.dart';

class LawyerServices extends StatefulWidget {
  const LawyerServices({super.key});

  @override
  State<LawyerServices> createState() => _LawyerServicesState();
}

class _LawyerServicesState extends State<LawyerServices> {
  List<DateTime> next9days = [];
  List<String> dayOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> times = [
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
  ];
  List<String> monthes = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  int selectedMonth = 0;
  int selectedTime = 0;
  int selectedVoiceTime = 10;
  int selectedDate = 0;
  int selectedService = 2;
  int selectedDuration = 1;

  @override
  void initState() {
    super.initState();
    generateNext9days();
  }

  goNextMonth() {
    if (selectedMonth == 11) {
      selectedMonth = 0;
    } else {
      selectedMonth++;
    }

    setState(() {});
  }

  goPreviousMonth() {
    if (selectedMonth == 0) {
      selectedMonth = 11;
    } else {
      selectedMonth--;
    }

    setState(() {});
  }

  generateNext9days() {
    DateTime today = DateTime.now();

    for (int i = 1; i < 10; i++) {
      next9days.add(DateTime.now().add(Duration(days: i)));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Select Date",
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              IconButton(
                onPressed: () => goPreviousMonth(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
              ),
              SizedBox(
                  width: 70,
                  child: Center(
                      child: Text(
                    monthes[selectedMonth],
                    style: TextStyle(
                        color: mainMaterialBlue, fontWeight: FontWeight.bold),
                  ))),
              IconButton(
                onPressed: () => goNextMonth(),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 52,
            child: ListView.builder(
              itemCount: next9days.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    selectedDate = index;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedDate == index
                          ? mainMaterialBlue
                          : Colors.transparent,
                    ),
                    width: 52,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            next9days[index].toString().substring(8, 10),
                            style: TextStyle(
                                color: selectedDate == index
                                    ? Colors.white
                                    : Colors.black54),
                          ),
                        ),
                        Center(
                            child: Text(
                          dayOfWeek[next9days[index].weekday - 1],
                          style: TextStyle(
                              color: selectedDate == index
                                  ? Colors.white
                                  : Colors.black54),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Select Time",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: times.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  selectedTime = index;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedTime == index
                          ? mainMaterialBlue
                          : Colors.transparent,
                      // border: Border.all(
                      //     color: selectedDate == index
                      //         ? Colors.black
                      //         : Colors.transparent),
                    ),
                    child: Center(
                        child: Text(
                      times[index],
                      style: TextStyle(
                          color: selectedTime == index
                              ? Colors.white
                              : Colors.black45),
                    )),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Select Service",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  selectedService = 1;
                  selectedDuration = selectedDuration;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: selectedService == 1 ? 2 : 0.5,
                          color: selectedService == 1
                              ? mainMaterialBlue
                              : Colors.black54)),
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/text.webp",
                            ),
                            colorFilter: selectedService == 1
                                ? null
                                : ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.saturation,
                                  ),
                          ),
                        ),
                      ),
                      Text(
                        "Text Only",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedService = 2;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: selectedService == 2 ? 2 : 0.5,
                          color: selectedService == 2
                              ? mainMaterialBlue
                              : Colors.black54)),
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/voice-call.webp",
                            ),
                            colorFilter: selectedService == 2
                                ? null
                                : ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.saturation,
                                  ),
                          ),
                        ),
                      ),
                      Text(
                        "Voice Call",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedService = 3;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: selectedService == 3 ? 2 : 0.5,
                          color: selectedService == 3
                              ? mainMaterialBlue
                              : Colors.black54)),
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/video-call.jpeg",
                            ),
                            colorFilter: selectedService == 3
                                ? null
                                : ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.saturation,
                                  ),
                          ),
                        ),
                      ),
                      Text(
                        "Video Call",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Select Duration",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: mainMaterialBlue,
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "${selectedDuration}0 Minutes",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (selectedDuration != 1) {
                        selectedDuration--;
                      }
                      setState(() {});
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontSize: 16,
                              color: mainMaterialBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (selectedDuration != 6) {
                        selectedDuration++;
                      }
                      setState(() {});
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                              color: mainMaterialBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total Amount ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                selectedService == 0
                    ? "0 BD"
                    : selectedService == 1
                        ? "${selectedDuration}0 BD"
                        : selectedService == 2
                            ? "${selectedDuration * 2}0 BD"
                            : "${selectedDuration * 3}0 BD",
                style: TextStyle(
                    color: mainMaterialBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              InkWell(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: mainMaterialBlue),
                  child: Center(
                      child: Text(
                    "Confirm Booking",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
