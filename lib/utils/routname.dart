import 'package:get/get.dart';
import 'package:note/view/homescreen.dart';

import '../view/notescreen.dart';

List<GetPage> getpage=[
  GetPage(name: '/', page: ()=>HomeScreen(),),
  GetPage(name: '/home', page: ()=>Notescreen(),)
];