import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class MI {
  String title;
  int amount;

  factory MI.fromJson(Map<String, dynamic> json) => MI(
        title: json["title"],
        amount: json["amount"],
      );
  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "amount": this.amount,
    };
  }

  MI({
    required this.title,
    required this.amount,
  });
}
