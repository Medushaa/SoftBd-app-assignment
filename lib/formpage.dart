import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:softbd_assignment_app/home.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

class myForm extends StatefulWidget {
  const myForm({super.key});

  @override
  State<myForm> createState() => _myFormState();
}

class _myFormState extends State<myForm> {
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    void submitForm(BuildContext context) {
      // Validate form fields
      // if (_nameController.text.isEmpty ||
      //     _emailController.text.isEmpty ||
      //     _locationController.text.isEmpty ||
      //     _selectedDate == null ||
      //     _descriptionController.text.isEmpty) {
      //   return;
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(16.0),
            insetPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/tick.png', width: 120.0, height: 120.0),
                const SizedBox(height: 8.0),
                const Text(
                  'নতুন অনুচ্ছেদ সংরক্ষণ',
                  style: TextStyle(
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
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
                  nameController.clear(); //clear inputs 
                  emailController.clear();
                  locationController.clear();
                  descriptionController.clear();
                  _dateController.clear();
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 125, 173, 94),
                        Color.fromARGB(255, 57, 116, 76)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
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
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:8.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(FluentIcons.arrow_left_24_regular),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(index: 1)),
                );
              },
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('নতুন যোগ করুন'),  
              ],
            ),
            actions: [
              Container(
                child: const SizedBox(width: 40.0),
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
              controller: nameController,
              decoration: const InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 57, 116, 76)),
                ),
                labelText: 'অনুচ্ছেদ',
                hintText: "অনুচ্ছেদ লিখুন (৪৫ শব্দ)"),
            ),

            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 57, 116, 76)),
                ),
                labelText: 'অনুচ্ছেদের বিভাগ', 
                hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
              ),
            ),

            const SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'তারিখ ও সময়',
                filled: true,
                prefixIcon: Icon(FluentIcons.calendar_12_regular),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 57, 116, 76)),
                ),
                hintText: 'নির্বাচন করুন',
              ),
              readOnly: true,
              onTap: () {
                _selectDate();
              },
            ),

            const SizedBox(height: 16.0),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 57, 116, 76)),
                ),
                prefixIcon: Icon(FluentIcons.location_12_regular),
                contentPadding:
                  const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'স্থান',
                hintText: 'নির্বাচন করুন',
              ),
            ),

            const SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 57, 116, 76)),
                ),
                contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                labelText: 'অনুচ্ছেদের বিবরণ',
                hintText: 'কার্যক্রম বিবরণ করুন (১২০ শব্দ)',
                ),
            ),
            
            const SizedBox(height: 32.0),
            GestureDetector(
              onTap: () => submitForm(context),
              child: Container(
                height: 50,
                //width: 110,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 125, 173, 94), Color.fromARGB(255, 57, 116, 76)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0), 
                ),
                child: const Center(
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

  Future<void> _selectDate() async {
    DateTime? _selectedDate = await showOmniDateTimePicker(context: context);
    // DateTime? _selectedDate = await showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(), //start date of calender
    //   firstDate: DateTime(2000), 
    //   lastDate: DateTime(2100), //calender 2000-2100
    // ); //for date only not time
    if (_selectedDate != null){
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy HH:mm').format(_selectedDate);
      });
    }
  }
}
