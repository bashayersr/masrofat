import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masrofat/screens/home_screen.dart';
import 'package:masrofat/screens/splash.dart';
import 'model/Muser.dart';

void main() {
  runApp(const MyApp());
}
//
// List<MI1> MIFromJson(String str) =>
//     List<MI1>.from(json.decode(str).map((x) => MI1.fromJson(x)));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int? sal=sal;
  // var name='';
  // var date='';
  // var salary = 0;
  List<MI1> User = <MI1>[];

  // loadMI1() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     try {
  //       User = MIFromJson(prefs.getString("User")!);
  //       // sal = MIFromJson(prefs.getInt("sal")!);
  //     } catch (e) {}
  //   });
  // }

  @override
  Widget build(BuildContext context) {
// loadMI1();
//     if(User[0].sal==0){
    return GetMaterialApp(
      home: Splash(),
    );
    //   } return GetMaterialApp(
    //     // home: SalaryScreen1(sal: User[index].sal.toString(), name:User[index].name,date:User[index].date),
    // home: Base(),
    //   );
    // }
    // name: User[0].name,date: User[0].date,sal:User[0].sal.toString()
    // @override
    // void initState() {
    //   super.initState();
    //   loadMI1();
    // }
  }
}
