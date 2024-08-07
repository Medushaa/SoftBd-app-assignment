import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:bangla_converter/bangla_converter.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Expiration date
    DateTime startTime = DateTime(2024, 1, 1, 0, 0); 
    DateTime expireDate = DateTime(2030, 1, 31, 12, 0); // 1st January 2030, 12:00

    Duration totalTime = expireDate.difference(startTime);
    Duration timeLeft = expireDate.difference(DateTime.now());
    Duration timeSpent = DateTime.now().difference(startTime);

    double progress = 1 - (timeLeft.inDays / totalTime.inDays);

    int yearsLeft = timeLeft.inDays ~/ 365;
    int monthsLeft = (timeLeft.inDays % 365) ~/ 30;
    int daysLeft = timeLeft.inDays % 30;
    int monthsGone = timeSpent.inDays ~/ 30;
    int daysGone = timeSpent.inDays % 30;
    

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Scaffold(
          // Top bar
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(FluentIcons.line_horizontal_3_20_filled),
            onPressed: () {},
          ),
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/demo_pc.png',
                fit: BoxFit.contain,
                height: 25,
              ),
              const SizedBox(width: 8), 
              const Text('Flutter Task'),  
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(8.0), 
              decoration: const BoxDecoration(
                color: Color.fromARGB(10, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(FluentIcons.alert_badge_24_regular),
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
              margin: const EdgeInsets.all(16),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.0,  
                      backgroundColor: Colors.grey[200],
                      child: const Icon(
                        Icons.person,
                        size: 40.0,  
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'মাসুদা রহমান ফাতিমা',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'সফটবিডি লিমিটেড',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Icon(
                              FluentIcons.location_16_regular,
                              size: 14.0,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              'ঢাকা',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Expiration date
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
              padding: const EdgeInsets.all(8.0),
              height: 160.0,
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 10.0,
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 57, 139, 83)),
                                semanticsLabel: 'Linear progress indicator',
                              ),
                            ),
                            Center(
                              child: Text(
                                BanglaConverter.engToBan("$monthsGone মাস $daysGone দিন"),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
                          'সময় অতিবাহিত',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 22.0),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'মেয়াদকাল',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              //SizedBox(width: 8.0),
                              const Icon(
                                FluentIcons.calendar_12_regular,
                                size: 16.0,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                BanglaConverter.engToBan("${startTime.day}ই জানুয়ারী ${startTime.year} - ${expireDate.day}ই জানুয়ারী ${expireDate.year}"),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            'আরোও বাকি',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTimeBox(yearsLeft, 'বছর'),
                              const SizedBox(width:18.0),
                              _buildTimeBox(monthsLeft, 'মাস'),
                              const SizedBox(width:18.0),
                              _buildTimeBox(daysLeft, 'দিন'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      
              // the menu options
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.8, 
                  children: List.generate(6, (index) {
                    return _buildGridItem(index);
                  }),
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
  }

  //for the time left boxes
  Widget _buildTimeBox(int value, String label) {
    int firstDigit = value ~/ 10;
    int secDigit = value % 10;
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
              child: Text(
                BanglaConverter.engToBan("$firstDigit"),
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(width: 4.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
              child: Text(
                BanglaConverter.engToBan("$secDigit"),
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.0,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset( 
                'assets/menu_$index.png',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Flexible(
          child: Column(
            children: [
              const Text("মেনু নং", 
                style: TextStyle(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                BanglaConverter.engToBan("0000$index"), 
                style: const TextStyle(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}