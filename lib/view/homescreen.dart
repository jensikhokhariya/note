import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note/controller/dbhelper.dart';
import 'package:note/controller/homecontroller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Homecontroller homecontroller = Get.put(Homecontroller());
  TextEditingController note = TextEditingController();

  @override
  void initState() {
    super.initState();
    homecontroller.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("NOTES"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: homecontroller.l1.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  color: Colors.orange.shade50,
                  child: ListTile(
                    leading: Text("${homecontroller.l1[index]['id']}"),
                    title: Text("${homecontroller.l1[index]['note']}"),
                    trailing: SizedBox(
                      height: 70,
                      width: 150,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              note = TextEditingController(
                                text: homecontroller.l1[index]['note'],
                              );
                              update("${homecontroller.l1[index]['id']}");
                            },
                            icon: Icon(Icons.edit,color: Colors.green.shade800,),
                          ),
                          SizedBox(width: 10,),
                          IconButton(
                            onPressed: () {
                              DBhelper.intence.delete("${homecontroller.l1[index]['id']}");
                              homecontroller.getdata();
                            },
                            icon: Icon(Icons.delete,color: Colors.red,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/home');
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
  void update(String id){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        actions: [
          TextField(
            controller: note,
            decoration: InputDecoration(
              hintText: "Note",
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            DBhelper.intence.update(note.text, id);
            homecontroller.getdata();
          }, child: Text("creat"),),
        ],
      );
    });
  }
}
