import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom/constance.dart';
import '../custom/custom_buttom_social.dart';
import '../custom/custom_flooting_button.dart';
import '../custom/custom_text.dart';
import '../model/MI.dart';

List<MI> MIFromJson(String str) =>
    List<MI>.from(json.decode(str).map((x) => MI.fromJson(x)));

class EltezamtScreen extends StatefulWidget {
  String sal;
  var r;

  EltezamtScreen({Key? key, required this.sal, this.r}) : super(key: key);

  @override
  State<EltezamtScreen> createState() => _EltezamtScreenState();
}

class _EltezamtScreenState extends State<EltezamtScreen> {
  final _amuntController = TextEditingController();
  final _titleController = TextEditingController();
  List<MI> Il = <MI>[];

  loadMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      try {
        Il = MIFromJson(prefs.getString("Iltizamat")!);
      } catch (e) {}
    });
  }

  void _add(BuildContext context, String masrofat1, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Il.add(MI(title: masrofat1, amount: amount));
    prefs.setString('Iltizamat', jsonEncode(Il));
    showSnackBar(context, 'تمت الاضافه');
    _titleController.clear();
    _amuntController.clear();
  }

  void _delete(BuildContext context, int pos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Il.removeAt(pos);
    prefs.setString('Iltizamat', jsonEncode(Il));
    showSnackBar(context, 'تم المسح ');
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
                text: 'إلتزاماتي',
                imageName: 'assets/images/Icon.png',
                onPress: () {},
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                  child: CustomText(
                text: (' ${this.widget.r = int.parse(widget.sal) / 2}'),
              ))
            ]),
            Row(children: [
              SizedBox(
                width: 20,
              ),
              Container(
                  child: CustomText(
                text: (" المتبقي من الالتزامات "),
              )),
              SizedBox(
                width: 50,
              ),
              Container(
                  child: CustomText(
                text: (' ${this.widget.r = int.parse(widget.sal) / 2}'),
              ))
            ]),
          ])),

    Container(
      width: 500,
    height: 400,
    child: ListView.builder(
          // return ListView.builder(
          shrinkWrap: true,
          itemCount: Il.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 2.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text(Il[position].title),
                subtitle: Text(Il[position].amount.toString()),
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
                              text: "إضافة إلتزام جديد",
                            ),
                            TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                  hintText: " ",
                                  border: UnderlineInputBorder(),
                                  labelText: 'الالتزام'),
                              onChanged: (String value) {},
                            ),
                            TextFormField(
                              controller: _amuntController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: " ",
                                  border: UnderlineInputBorder(),
                                  labelText: 'قيمة الالتزام'),
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
          child: Text('اضافة التزام')),

    ]));
  }

  @override
  void initState() {
    super.initState();
    loadMI();
  }
}
