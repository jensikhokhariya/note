import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note/controller/dbhelper.dart';
import 'package:note/controller/homecontroller.dart';

class Notescreen extends StatefulWidget {
  const Notescreen({Key? key}) : super(key: key);

  @override
  State<Notescreen> createState() => _NotescreenState();
}

class _NotescreenState extends State<Notescreen> {
  Homecontroller homecontroller = Get.put(Homecontroller());
  TextEditingController n1 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Note"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: n1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Note",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  DBhelper.intence.insert(n1.text);
                  homecontroller.getdata();

                  Get.back();
                },
                child: Text("Add"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
