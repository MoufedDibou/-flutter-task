// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  StreamSubscription? connection;
  bool isoffline = false;

  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/simply.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["languages"];
    });
  }

  @override
  void initState() {
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        setState(() {
          isoffline = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    connection!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Powered by Netcore Soft',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 8),
            )),
        actions: [
          Icon(
            Icons.warning,
            color: Colors.red,
          ),
          Icon(Icons.list_alt_outlined),
          Icon(Icons.restart_alt_rounded, color: Colors.black),
          Icon(Icons.wifi, color: isoffline ? Colors.black : Colors.green)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(8),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.blue, width: 5))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.network(
                          'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                          width: 75,
                          height: 75,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'google search engine',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  )),
              Text(
                'Got Feedback ?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Take 1 minute survey',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Click to Start',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.normal),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.white,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "ابدأ",
                              //  AppLocalizations.of(context)!.start,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                      Material(
                        color: Colors.white,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "start",
                              //  AppLocalizations.of(context)!.start,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                      Material(
                        color: Colors.white,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "شروع كنيد",
                              style: TextStyle(color: Colors.blue),
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        'https://icons.iconarchive.com/icons/wikipedia/flags/256/SA-Saudi-Arabia-Flag-icon.png',
                        width: 60,
                        height: 60,
                      ),
                      Image.network(
                          'https://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/256/England-Flag-icon.png',
                          width: 60,
                          height: 60),
                      Image.network(
                          'https://icons.iconarchive.com/icons/hopstarter/square-flags/256/Pakistan-Flag-icon.png',
                          width: 60,
                          height: 60)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// saudai    https://icons.iconarchive.com/icons/wikipedia/flags/256/SA-Saudi-Arabia-Flag-icon.png
/// 
///    england   https://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/256/England-Flag-icon.png
/// 
/// 
/// pakstan     https://icons.iconarchive.com/icons/gosquared/flag/64/Pakistan-flat-icon.png
/// 
/// 
///  pakistan 222       https://icons.iconarchive.com/icons/hopstarter/square-flags/256/Pakistan-Flag-icon.png