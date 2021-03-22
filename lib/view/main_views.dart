import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_sisola_dev/provider/service/service_background.dart';
import 'package:mobile_sisola_dev/provider/service/service_kontrak.dart';
import 'package:mobile_sisola_dev/view/page/home/home_page.dart';
import 'package:provider/provider.dart';

class MainViews extends StatefulWidget {
  @override
  _MainViewsState createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  @override
  void initState() {
    super.initState();
    getToken();
    Timer.periodic(Duration(minutes: 57), (timer) {
      print('time periodic run ${timer.tick}');
      getToken();
    });
  }

  getToken() async {
    await BackgroundServices().getToken();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ServicesKontrak()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
