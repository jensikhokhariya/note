import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/utils/routname.dart';

void main(){
  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getpage,
    ),
  );
}