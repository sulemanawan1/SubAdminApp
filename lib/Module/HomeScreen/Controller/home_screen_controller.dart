
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Login/Model/User.dart';

class HomeScreenController extends GetxController
{
  late final User user;
  var userdata= Get.arguments;
  var scaffoldKey = GlobalKey<ScaffoldState>();

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user=userdata;

  }







}