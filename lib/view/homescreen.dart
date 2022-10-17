import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note/controller/homecontroller.dart';
import 'package:note/view/notescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Homecontroller homecontroller = Get.put(Homecontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("NOTES"),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: homecontroller.l1.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${homecontroller.l1[index]['id']}"),
              title: Text("${homecontroller.l1[index]['note']}"),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              Notescreen(),
            );
          },
          backgroundColor: Colors.pink,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
