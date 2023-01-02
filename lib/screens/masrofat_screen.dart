import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:masrofat/custom/constance.dart';
import 'package:masrofat/custom/custom_button.dart';

import 'package:masrofat/salary_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom/custom_buttom_social.dart';
import '../custom/custom_flooting_button.dart';
import '../custom/custom_text.dart';
import '../model/MI.dart';

List<MI> MIFromJson(String str) =>
    List<MI>.from(json.decode(str).map((x) => MI.fromJson(x)));

class MasrofatScreen extends StatefulWidget {
  String sal;
  var m;
  MasrofatScreen({Key? key, required this.sal, this.m}) : super(key: key);

  @override
  State<MasrofatScreen> createState() => _MasrofatScreenState();
}

class _MasrofatScreenState extends State<MasrofatScreen> {
  List<MI> masrofat = <MI>[];

  loadMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        masrofat = MIFromJson(prefs.getString("Masrofat")!);
      } catch (e) {}
    });
  }

  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();

  void _add(BuildContext context, String masrofat1, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    masrofat.add(MI(title: masrofat1, amount: amount));
    prefs.setString('Masrofat', jsonEncode(masrofat));

    showSnackBar(context, 'تمت الاضافه');
    _titleController.clear();
    _amuntController.clear();
  }

  void _delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    masrofat.removeAt(pos);
    prefs.setString('Masrofat', jsonEncode(masrofat));
    showSnackBar(context, 'تم المسح  ');
    _titleController.clear();
    _amuntController.clear();
  }

  void showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar((snackBar));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Card(
          margin:
              const EdgeInsets.only(top: 1, left: 60, right: 60, bottom: 50),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Row(children: [
              CustomButtonSocial(
                text: 'مصروفاتي',
                imageName: 'assets/images/Icon4.png',
                onPress: () {},
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                  child: CustomText(
                text: ('${this.widget.m = int.parse(widget.sal) * 30 / 100}'),
              ))
            ]),
            Row(children: [
              SizedBox(
                width: 20,
              ),
              Container(
                  child: CustomText(
                text: ("المتبقي من المصروفات "),
              )),
              SizedBox(
                width: 50,
              ),
              Container(
                  child: CustomText(
                text: (' ${this.widget.m = int.parse(widget.sal) * 30 / 100}'),
              ))
            ]),
          ])),
    Container(
    width: 500,
    height: 400,

    child:ListView.builder(
          // return ListView.builder(
          shrinkWrap: true,
          itemCount: masrofat.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 2.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text(masrofat[position].title),
                subtitle: Text(masrofat[position].amount.toString()),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _delete(context, position);
                    });
                  },
                ),
              ),
            );
          }),),
      TextButton(
          onPressed: () {
            print('hi');
            setState(() {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "إضافة مصروف جديد",
                            ),
                            TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                  hintText: " ",
                                  border: UnderlineInputBorder(),
                                  labelText: 'المصروفات'),
                              onChanged: (String value) {},
                            ),
                            TextFormField(
                              controller: _amuntController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: " ",
                                  border: UnderlineInputBorder(),
                                  labelText: 'قيمة المصروفات'),
                              onChanged: (String value) {},
                            ),
                          ]),
                      actions: <Widget>[
                        TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: const Text('إلغاء')),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (_titleController.text.isEmpty ||
                                  _amuntController.text.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        icon: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          "الرجاء إكمال المطلوب ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      );
                                    });
                              } else {
                                // print(
                                //   reason,
                                // );
                                _add(
                                  context,
                                  _titleController.text,
                                  int.parse(_amuntController.text),
                                );

                                Navigator.pop(context);
                              }
                            });
                          },
                          child: const Text("إضافة"),
                        ),
                      ],
                    );
                  });
            });
          },
          child: Text('اضافة مصروف'))
    ]));
  }

  @override
  void initState() {
    super.initState();
    loadMI();
  }
}
