// import 'dart:ui';
import 'dart:io' show File;

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

// import 'model/user.dart';


class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}
  

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  String checkIn = "--/--";
  String checkOut = "--/--";
  String snap = "";
  String snap2 = "";
  String datesnap = "";
  String datesnap2 = "";
  String timeIn = " ";
  String timeOut = " ";

  Color primary = const Color.fromARGB(252, 107, 152, 173);

   File? _image ;
   File? _image2 ;
   
  final picker = ImagePicker();
  final picker2 = ImagePicker();

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickerImage = await picker.getImage(source: ImageSource.camera,
    maxHeight: 75,
    maxWidth: 75,
    imageQuality: 90,
    );
    setState(() {
      if(pickerImage != null){
    _image = File(pickerImage.path);
      } else{
        print('no image selected');
      }
    });
  }

  Future getImage2() async {
    // ignore: deprecated_member_use
    final pickerImage2 = await picker2.getImage(source: ImageSource.camera,
    maxHeight: 75,
    maxWidth: 75,
    imageQuality: 90,
    );
    setState(() {
      if(pickerImage2 != null){
    _image2 = File(pickerImage2.path);
      } else{
        print('no image selected');
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {

  
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;

   return Scaffold(
      body: SingleChildScrollView(
      
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 35),
              child: Text(
                "Welcome,",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "NexaRegular",
                  fontSize: screenWidth / 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Employee! ",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: screenWidth / 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 32),
              child: Text(
                "Today's Status",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: screenWidth / 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 32),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: screenWidth / 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          checkIn,
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: screenWidth / 18,
                          ),
                        ),
                      ],
                    ),
                    ),
                    Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: screenWidth / 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          checkOut,
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: screenWidth / 18,
                          ),
                        ),
                      ],
                    ),
                    ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 18,
                    fontFamily: "NexaBold",
                  ),
                  children: [
                    TextSpan(
                      text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 20,
                        fontFamily: "NexaBold",
                      ),
                    ),
                  ],
                ),
                ),
            ),
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()),
                    style: TextStyle(
                      fontFamily: "NexaRegular",
                      fontSize: screenWidth / 20,
                      color: Colors.black54,
                    ),
                    ),
                );
              }
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Container(
                  
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 20),
                  
                  child: Center(
                    
                    child: _image == null ? Text(' '): Image.file(_image!),
                  
                  ),
                ),
                Text(
                  
                  "Time In: "+timeIn,
                  
                style: TextStyle(
                  fontFamily: "NexaRegular",
                      fontSize: screenWidth / 26,
                      color: Colors.black54,
                ),
                
                ),Text(" - "+datesnap,
                style: TextStyle(
                  fontFamily: "NexaRegular",
                      fontSize: screenWidth / 26,
                      color: Colors.black54,
                ),
                ),
              ],
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Container(
                  
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 20),
                  
                  child: Center(
                    
                    child: _image2 == null ? Text(' '): Image.file(_image2!),
                  
                  ),
                ),
                Text(
                  
                  "Time Out: "+timeOut,
                  
                style: TextStyle(
                  fontFamily: "NexaRegular",
                      fontSize: screenWidth / 26,
                      color: Colors.black54,
                ),
                
                ),Text(" - "+datesnap2,
                style: TextStyle(
                  fontFamily: "NexaRegular",
                      fontSize: screenWidth / 26,
                      color: Colors.black54,
                ),
                ),
              ],
            ),
            checkIn == "--/--" && checkOut == "--/--" ? Container(
              margin: EdgeInsets.only(top: 130),
              child: Builder(
                builder: (context){
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  
                  return SlideAction(
                    text: "Slide to Check In",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth / 20,
                      fontFamily: "NexaRegular",
                    ),
                    outerColor: Colors.white,
                    innerColor: primary,
                    key: key,
                    onSubmit: () {

                      
                    snap = (DateFormat('hh:mm').format(DateTime.now())).toString();
                    datesnap =(DateFormat('dd MMMM yyyy').format(DateTime.now())).toString();
                    checkIn = snap;
                    getImage();
                    timeIn = checkIn;
                    setState(() {});

                    },
                  );
                },
                ),
            ) : checkOut == "--/--" ? Container(
              margin: EdgeInsets.only(top: 75),
              child: Builder(
                builder: (context){
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  
                  return SlideAction(
                    text: "Slide to Check Out",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth / 20,
                      fontFamily: "NexaRegular",
                    ),
                    outerColor: Colors.white,
                    innerColor: primary,
                    key: key,
                    onSubmit: () {

                      
                    snap2 = (DateFormat('hh:mm').format(DateTime.now())).toString();
                    checkOut = snap2;
                    datesnap2 =(DateFormat('dd MMMM yyyy').format(DateTime.now())).toString();
                    getImage2();
                    timeOut = checkOut;
                    setState(() {});

                    },
                  );
                },
                ),
            ) : Container(
              margin: EdgeInsets.only(top: 60),
              child: Text("You have already checked out.",
              style: TextStyle(
                fontFamily: "NexaRegular",
                fontSize: screenWidth / 20,
                color: Colors.black54
              ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}