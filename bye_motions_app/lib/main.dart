import 'package:flutter/material.dart';
import 'package:bye_motions_app/views/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}
