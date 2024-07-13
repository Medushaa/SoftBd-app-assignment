import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            //the me card
            Container(
              margin: EdgeInsets.all(16),
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                ),
            ),

            //Expiration date
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
              padding: const EdgeInsets.all(8.0),
              height: 160.0,
              child: Row(
              )
            ),
  
              

            ],
          ),
        ),

    );
  }
}