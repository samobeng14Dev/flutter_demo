import 'package:flutter/material.dart';
import 'package:timer_app/pages/choose_locatiion.dart';
import 'package:timer_app/pages/home.dart';
import 'package:timer_app/pages/loading.dart';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes:{
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    "/location":(context)=>ChooseLocatiion()
  }
));

