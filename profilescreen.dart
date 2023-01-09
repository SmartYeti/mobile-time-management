// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:time_management/model/user.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color.fromARGB(252, 107, 152, 173);
  String birth = "Date of Birth";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // void pickUploadProfilePic() async {
  //   final image = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 512,
  //     maxWidth: 512,
  //     imageQuality: 90,
  //   );
    
  //   setState(() {
  //     User.profilePicLink = Value(image);
  //   });
    
  // }
  

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
              margin: EdgeInsets.only(top: 80, bottom: 24),
              height: 120,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primary,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Employee",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 24,),
            textField("First Name","First Name",firstNameController),
            textField("Last Name","Last Name",lastNameController),
            Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Date of Birth",
            style: TextStyle(
              fontFamily: "NexaBold",
              color: Colors.black87
            ),
            ),
        ),
            GestureDetector(
              onTap: (() {
              showDatePicker(
                context: context,
                 initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                   lastDate: DateTime.now(),

                  builder:  (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: primary,
                          secondary: primary, 
                          onSecondary: Colors.white,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: primary,
                          ),
                        ),
                        textTheme: TextTheme(
                          headline4: TextStyle(
                            fontFamily: "NexaBold",
                          ), 
                          overline: TextStyle(
                            fontFamily: "NexaBold"
                          ),
                          button: TextStyle(
                            fontFamily: "NexaBold",
                          ),
                        ),
                      ),
                      child: child!,
                      );
                  }

                   ).then((value){
                    setState(() {
                      birth = DateFormat("MM/dd/yyyy").format(value!);
                    });
                   });
              }
              ),
              child: Container(
                height: kToolbarHeight,
                width: screenWidth,
                padding: EdgeInsets.only(left: 9),
                  margin: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.black54,
                  ),
                ),
                child: Align(
            
                  alignment: Alignment.centerLeft,
                  child: Text(
                    birth,
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "NexaBold",
                      fontSize: 16,
                    ),
                    
                    ),
                    ),
              ),
            ),
            textField("Address","Address",addressController),
            GestureDetector(
              onTap: () async {
                String firstName = firstNameController.text;
                String lastName = lastNameController.text;
                String birthDate = birth;
                String address = addressController.text;

                if(firstName.isEmpty){
                  showSnackBar("Please Enter First Name!");
                } else if(lastName.isEmpty){
                  showSnackBar("Please Enter Last Name!");
                } else if(birthDate.isEmpty){
                  showSnackBar("Please Enter Birth Date!");
                } else if(address.isEmpty){
                  showSnackBar("Please Enter Address!");
                } else{

                }
              },
              child: Container(
                  height: kToolbarHeight,
                  width: screenWidth,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  color: primary,
                  
                  ),
                  child: Center(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "NexaBold",
                        fontSize: 16,
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

  Widget textField(String title, String hint, TextEditingController controller){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "NexaBold",
              color: Colors.black87
            ),
            ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: TextFormField(
                    controller: controller,
                    cursorColor: Colors.black54,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: "NexaBold",
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ),
        ),
      ],
    );
  }
  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text
          ),
        ),
    );
  }

}