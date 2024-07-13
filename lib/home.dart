import 'package:flutter/material.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'homepage.dart';
import 'calender.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePageContent(),  //calls the home class below
    CalendarPage(),   
    TimePage(), 
    ProfilePage(),  
  ];

  //Tab selection func
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      //Floating camera
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 125, 173, 94), Color.fromARGB(255, 57, 116, 76)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(30, 125, 173, 94),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(AkarIcons.camera, size: 30, color: Colors.white,),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(30, 125, 173, 94),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, -4),  
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          shape: CircularNotchedRectangle(), //for camera
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ //call the widget below for each
              _buildNavBarItem(
                FluentIcons.home_28_regular, 
                FluentIcons.home_28_filled, 
                'Home', 
                0
              ),
              _buildNavBarItem(
                FluentIcons.calendar_28_regular, 
                FluentIcons.calendar_28_filled, 
                'Calendar', 
                1
              ),
              SizedBox(width: 48),
              _buildNavBarItem(
                FluentIcons.text_expand_24_regular, 
                FluentIcons.text_expand_24_filled, 
                'List', 
                2
              ),
              _buildNavBarItem(
                FluentIcons.person_28_regular, 
                FluentIcons.person_28_filled, 
                'Profile', 
                3
              ),
            ],
          ),
        ),
      ),

    );
  }
  // Function to build each navigation bar item
Widget _buildNavBarItem(IconData regularIcon, IconData filledIcon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? filledIcon : regularIcon,
            color: Colors.black,
            size: 24,
          ),
          if (isSelected) 
            Container( //the dot below the icons
              margin: EdgeInsets.only(top: 4),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}




//The 2 empty pages (homepage and calender page on seperate files)

class TimePage extends StatelessWidget {
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
            Text('Time Page'),  
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

      body: Center(
        child: Text('Some kind of time page'),
      ),

    );
  }
}

class ProfilePage extends StatelessWidget {
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
            Text('Profile Page'),  
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

      body: Center(
        child: Text('See your profile details here'),
      ),

    );
  }
}