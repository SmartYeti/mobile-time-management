import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color.fromARGB(252, 107, 152, 173);
  double percent = 0.0;
  static int timeInMinute = 3;
  int timeInSec = timeInMinute * 60;
  late Timer timer;
  // double perMin = timeInMinute/100;


  _StartTimer(){
    double percent = 0.0;
    int Time = timeInMinute * 60;
     double SecPercent = (Time/100);
    //  double SecPercent2 = (SecPercent/100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(Time > 0){
          Time--;
          if(Time % 60 == 0){
            timeInMinute--;
          }
           if(Time%SecPercent == 0){
            if(percent<1.0){
              percent += 0.01;
            }
            else{
              percent = 1.0;
            }
           }
           
        }
        
        else{
          Time--;
          if(Time % 60 == 0){
            timeInMinute--;
          }

          
        }
      });
     }
     );
  }
  // _StopTimer(){
  

  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: primary,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Lunch Break",
                  style: TextStyle(
                    color: Colors.white,
                  fontFamily: "NexaRegular",
                  fontSize: 40,
                ),
                ),
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 150,
                    lineWidth: 20,
                    progressColor: Colors.white,
                    
                    center: Text(
                      "$timeInMinute",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80
                      ),
                      
                    ),
                    
                  ),
                  
                   ),
                  //  
                  // timeInMinute == timeInMinute ? 
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: FloatingActionButton.extended(
                          
                          backgroundColor: Colors.white,
                          foregroundColor: primary,
                          icon: Icon(Icons.play_arrow),
                          onPressed: _StartTimer, label: Text("Start",
                          style: TextStyle(fontSize: 20),
                          
                          
                          ),
                          
                          
                          ),
                      ),
                      
                    ),
                    
                  // ) : timeInMinute == timeInMinute ? Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       margin: EdgeInsets.only(bottom: 30),
                  //       child: FloatingActionButton.extended(
                          
                  //         backgroundColor: Colors.white,
                  //         foregroundColor: primary,
                  //         icon: Icon(Icons.star_outline),
                  //         onPressed: _StartTimer, label: Text("Stop",
                  //         style: TextStyle(fontSize: 20),
                          
                  //         ),
                          
                          
                  //         ),
                  //     ),
                  //   ),

                  // ) : Container(
                    
                  ),
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       margin: EdgeInsets.only(bottom: 30),
                  //       child: FloatingActionButton.extended(
                          
                  //         backgroundColor: Colors.white,
                  //         foregroundColor: primary,
                  //         icon: Icon(Icons.pause),
                  //         onPressed: _StopTimer, label: Text("Stop",
                  //         style: TextStyle(fontSize: 20),
                          
                          
                  //         ),
                          
                          
                  //         ),
                  //     ),
                      
                  //   ),
                  // )
   
            ],
          ),
        ),
      ),
    );

  
  }
}