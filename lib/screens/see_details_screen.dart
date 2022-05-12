import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Widgets/counter.dart';
import '../Widgets/my_header.dart';
import '../brain.dart';
import '../constant.dart';

class SeeDetails extends StatefulWidget {
  final String countryName;
  const SeeDetails(@required this.countryName, {Key? key}) : super(key: key);

  @override
  State<SeeDetails> createState() => _SeeDetailsState();
}

class _SeeDetailsState extends State<SeeDetails> {
  var cases = 0;
  var active = 0;
  var critical = 0;
  var todayCases = 0;
  var todayDeaths = 0;
  var deaths = 0;
  var recovered = 0;
  var todayRecovered = 0;
  var date = DateFormat("dd-MM-yy").format(DateTime.now());
  String flag = "https://disease.sh/assets/img/flags/in.png";
  String s = "home";
  var data;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    AppBrain ab = new AppBrain(widget.countryName);
    var data = await ab.loaddata();
    setState(() {
      cases = data['cases'];
      active = data['active'];
      critical = data['critical'];
      deaths = data['deaths'];
      recovered = data['recovered'];
      todayRecovered = data['todayRecovered'];
      todayCases = data['todayCases'];
      todayDeaths = data['todayDeaths'];
      flag = data['countryInfo']['flag'];
      date = DateFormat.yMMMd().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home",
              visible: false,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   height: 60,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Color(0xffF3F3F3),
            //     borderRadius: BorderRadius.circular(25),
            //     border: Border.all(
            //       color: Color(0xFFE5E5E5),
            //     ),
            //   ),
            //   child: Row(
            //     children: [],
            //   ),
            // ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Details\n",
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xFF303030))),
                          TextSpan(
                            text: "Newest Update $date",
                            style: TextStyle(
                              color: kTextLightColor,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Cases: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                cases.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Today Cases: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                todayCases.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Deaths: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                deaths.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Today Deaths: ',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                todayDeaths.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Recovered: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                recovered.toString(),
                                style: TextStyle(
                                  fontSize: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Today Cured:',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                todayRecovered.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Active: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                active.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 175,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Critical: ',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                critical.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
