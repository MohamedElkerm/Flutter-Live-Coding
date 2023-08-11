import 'package:flutter/material.dart';
import 'package:gold_app/app/my_app.dart';
import 'package:gold_app/helper/remote/dio_helper.dart';
import 'package:gold_app/models/gold_model.dart';

void main() async {
  await DioHelper.dioInit();


  runApp(MyApp());
}


/*
  what is request 0:00
  why using request 3:40
  static data VS dynamic data in app 5:10
  what is CRUD 7:25
  CRUD example 10:22
  requests types 11:20
  how to dealing with http requests in flutter 13:57
  what is URL 16:34
  baseURL and path 20:30
  example of the path in PC Dirctories 23:56
  what is endpoint 28:32
  what is collection 31:15 
  what is postman 31:58 
  
  see real collection 33:29
  
*/