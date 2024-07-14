
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalVariable {


  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':  Get.find<GlobalRxVariableController>().token.value!,
  };

}

class GlobalRxVariableController extends GetxController {

  final notificationCount = Rxn<int>();
  final studentRecordId = Rxn<int>();
  final roleId = Rxn<int>();
  final classId = Rxn<int>();
  final sectionId = Rxn<int>();
  final token = Rxn<String>();
  final email = Rxn<String>();
  final currencySymbol = Rxn<String>();
  final studentId = Rxn<int>();
  final parentId = Rxn<int>();
  final staffId = Rxn<int>();
  final userId = Rxn<int>();
  RxBool isStudent = false.obs;
  RxBool isRtl = false.obs;

  final pusherApiKey = Rxn<String>();
  final pusherClusterKey = Rxn<String>();


}

