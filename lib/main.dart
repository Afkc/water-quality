import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyD7QTI9VrphGzZdEbp2igfvn8qufrFxaTg',
              appId: '1:1061898784024:android:e7df3dbec1c12f42ffe26d',
              messagingSenderId: '1061898784024',
              projectId: 'skripsi-907e0'))
      : await Firebase.initializeApp();

  Intl.defaultLocale = 'en_US';
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
