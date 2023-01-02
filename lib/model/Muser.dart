import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class MI1 {
  String name;
  String date;
   int sal;
  factory MI1.fromJson(Map<String, dynamic> json) => MI1(
    name: json["name"],
    date: json["date"],
    sal: json["sal"],
  );
  Map<String, dynamic> toJson(){
    return {
      "name": this.name,
      "date": this.date,
      "sal": this.sal,
    };
  }
  MI1({
    required this.name,
    required this.date,
    required this.sal,
  });

}