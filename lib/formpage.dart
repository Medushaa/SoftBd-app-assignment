import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:softbd_assignment_app/home.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class myForm extends StatelessWidget {
  const myForm({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _locationController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    DateTime? _selectedDate;

    void _selectDate(BuildContext context) async {
      DateTime? dateTime = await showOmniDateTimePicker(context: context);
      if (dateTime != null) {
        _selectedDate = dateTime;
      }
    }

    void _submitForm(BuildContext context) {
      // Validate form fields
      // if (_nameController.text.isEmpty ||
      //     _emailController.text.isEmpty ||
      //     _locationController.text.isEmpty ||
      //     _selectedDate == null ||
      //     _descriptionController.text.isEmpty) {
      //   return;
      // }
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Success'),
      //       content: Text('Form submitted successfully!'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(16.0),
            insetPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/tick.png', width: 120.0, height: 120.0),
                SizedBox(height: 8.0),
                Text(
                  'নতুন অনুচ্ছেদ সংরক্ষণ',
                  style: TextStyle(
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ\nসম্পুর্ন হয়েছে',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 125, 173, 94),
                        Color.fromARGB(255, 57, 116, 76)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      'আরো যোগ করুন',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },

      );
    }

    

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(FluentIcons.arrow_left_24_regular),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(index: 1)),
                );
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('নতুন যোগ করুন'),  
              ],
            ),
            actions: [
              Container(
                child: SizedBox(width: 40.0),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'অনুচ্ছেদ',
                hintText: "অনুচ্ছেদ লিখুন (৪৫ শব্দ)"),
        
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'অনুচ্ছেদের বিভাগ', 
                hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন"
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  labelText: 'তারিখ ও সময়',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(
                  _selectedDate != null
                      ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                      : 'নির্বাচন করুন',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'স্থান',
                suffixIcon: Icon(
                              FluentIcons.location_16_regular,
                              size: 14.0,
                              color: Colors.grey[600],
                            ),
                hintText: 'নির্বাচন করুন',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'অনুচ্ছেদের বিবরণ',
                hintText: 'কার্যক্রম বিবরণ করুন (১২০ শব্দ)',
                ),
            ),
            SizedBox(height: 32.0),
            GestureDetector(
              onTap: () => _submitForm(context),
              child: Container(
                height: 50,
                //width: 110,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 125, 173, 94), Color.fromARGB(255, 57, 116, 76)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0), 
                ),
                child: Center(
                  child: Text(
                    'সংগ্রহ করুন',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
