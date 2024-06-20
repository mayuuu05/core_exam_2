import 'package:core_exam_2/Screens/AddDataPage.dart';
import 'package:core_exam_2/Screens/home_screen.dart';
import 'package:core_exam_2/Screens/update_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoreExam2());
}

class CoreExam2 extends StatelessWidget {
  const CoreExam2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>HomeScreen(),
        '/detail':(context)=>AddDataPage(),
        '/update':(context)=>Update(),
      },
    );
  }
}

