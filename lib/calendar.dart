import 'package:bangla_converter/bangla_converter.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:softbd_assignment_app/formpage.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'formpage.dart';

Future<List<Album>> fetchAlbum() async { //from api link. returns a list
  final response = await http
      .get(Uri.parse('https://api.npoint.io/bc69ae1f6991da81ab9a'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,then parse the JSON.
    List<dynamic> data = json.decode(response.body)['data'];
    return data.map((album) => Album.fromJson(album)).toList();
    //return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {  //fields in the api. create an dart album 
  final String date;
  final String name;
  final String category;
  final String location;

  const Album({
    required this.date,
    required this.name,
    required this.category,
    required this.location,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      date: json['date'] ?? 'Unknown date',
      name: json['name'] ?? 'Unknown name',
      category: json['category'] ?? 'Unknown category',
      location: json['location'] ?? 'Unknown location',
    );
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() { //happens at start
    super.initState(); 
    futureAlbum = fetchAlbum();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Scaffold(
          // Top bar
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(FluentIcons.line_horizontal_3_20_filled),
            onPressed: () {},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('সময়রেখা', style: TextStyle(fontSize: 20)),  
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(8.0),  
              decoration: BoxDecoration(
                color: Color.fromARGB(30, 125, 173, 94),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(FluentIcons.alert_badge_24_regular),
                onPressed: () {},
              ),
            ),
          ],
        ),
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              //add new form
              Container(
                margin: EdgeInsets.only(top:16, left:16, right:16, bottom:6),
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        BanglaConverter.engToBan("আজ, ${DateTime.now().day} জুলাই"),
                        style: TextStyle(
                          fontSize: 18.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => myForm()),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [const Color.fromARGB(255, 125, 173, 94), Color.fromARGB(255, 57, 116, 76)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Center(
                          child: Text(
                            'নতুন যোগ করুন',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                  
                  ],
                ),
              ),
              //calender
              Container(
                margin: EdgeInsets.only(top:0, left:16, right:16, bottom:16),
                //height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
                    },
                    activeColor: Color.fromARGB(255, 57, 139, 83),
                    headerProps: const EasyHeaderProps(
                      monthPickerType: MonthPickerType.switcher,
                      dateFormatter: DateFormatter.fullDateDayAsStrMY(),
                    ),
                    dayProps: const EasyDayProps(
                      activeDayStyle: DayStyle(
                        borderRadius: 32.0,
                      ),
                      inactiveDayStyle: DayStyle(
                        borderRadius: 32.0,
                      ),
                    ),
                    timeLineProps: const EasyTimeLineProps(
                      hPadding: 8.0, // padding from left and right
                      separatorPadding: 8.0, // padding between days
                    ),
                  ),
                ),
              ),
              
              //SizedBox(height: 20.0), 
              Container(
                width: 1000,
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'আজকের কার্যক্রম',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      ///waaait
                      SizedBox(height:8),
                      FutureBuilder<Album>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // return Text('rhoioeihiwht');
                            return Column(
                              children: snapshot.data!.map((album) => Container(
                                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                        padding: EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              album.name,
                                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              'Category: ${album.category}',
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            Text(
                                              'Location: ${album.location}',
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                  
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                      
                    ],
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