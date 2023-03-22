import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor_detail.dart';
import 'package:medicare/screens/profile.dart';
import 'package:medicare/screens/tab.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => TabScreen(),
  '/detail': (context) => SliverDoctorDetail(),
  '/profile': (context) => ProfileScreen(),
};
