import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:note/controller/dbhelper.dart';

class Homecontroller extends GetxController{
  RxList l1 = [].obs;
  @override
  void onInit() {
    super.onInit();
    getdata();
  }
  void getdata() async{
    l1.value =await DBhelper.intence.readdata();
  }
}