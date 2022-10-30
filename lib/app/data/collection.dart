import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Collection {
  static double diagonal =
      sqrt((Get.height * Get.height) + (Get.width * Get.width));
}


// class _MyHomePageState extends State<MyHomePage> {
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    checkPermissions();
//  }
//  @override
//  void ini() {
//    Nearby().askExternalStoragePermission();
//    Nearby().askLocationAndExternalStoragePermission();
//    Nearby().askBluetoothPermission();
//  }
 
//  void checkPermissions() async {
//    var status = await Permission.manageExternalStorage.status;
//    if (!status.isGranted) {
//      await Permission.manageExternalStorage.request();
//    }
//  }
 
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Vx.gray200,
//      body: Stack(
//        children: [
//          Container(
//            height: MediaQuery.of(context).size.height * 0.9,
//            width: MediaQuery.of(context).size.width,
//            decoration: const BoxDecoration(
//              borderRadius: BorderRadius.only(
//                bottomLeft: Radius.circular(2100),
//                bottomRight: Radius.elliptical(10, 20),
//              ),
//              gradient: LinearGradient(
//                  begin: Alignment.centerRight,
//                  end: Alignment.centerLeft,
//                  colors: <Color>[
//                    Color.fromARGB(255, 77, 133, 230),
//                    Color.fromARGB(255, 5, 79, 205)
//                  ]),
//            ),
//          ),
//          Padding(
//              padding: EdgeInsets.only(
//                top: MediaQuery.of(context).size.height * 0.0575,
//                left: MediaQuery.of(context).size.width * 0.05,
//              ),
//              child: IconButton(
//                icon: Icon(CupertinoIcons.line_horizontal_3),
//                onPressed: () async {},
//                iconSize: 29,
//                color: Colors.white,
//              )),
//          Align(
//            alignment: Alignment.topCenter,
//            child: Padding(
//              padding: EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * 0.07),
//              child: const Text(
//                "XShare",
//                style: TextStyle(
//                    color: Colors.white,
//                    fontWeight: FontWeight.bold,
//                    fontSize: 21),
//                textAlign: TextAlign.center,
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.topCenter,
//            child: Padding(
//              padding: EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * 0.13),
//              child: const Text(
//                "Quickly Share & Receive Files",
//                style: TextStyle(color: Colors.white, fontSize: 16),
//                textAlign: TextAlign.center,
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.topCenter,
//            child: Padding(
//              padding: EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * 0.35),
//              child: InkWell(
//                borderRadius: BorderRadius.all(
//                    Radius.circular(MediaQuery.of(context).size.height * 0.13)),
//                onTap: () async {
//                  ini();
//                  Get.to(() => SenderView(a: 1));
//                },
//                child: Container(
//                  height: MediaQuery.of(context).size.height * 0.13,
//                  width: MediaQuery.of(context).size.height * 0.13,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(
//                          MediaQuery.of(context).size.height * 0.13)),
//                      color: Color.fromARGB(255, 118, 154, 216)),
//                  child: Center(
//                    child: Container(
//                      height: MediaQuery.of(context).size.height * 0.11,
//                      width: MediaQuery.of(context).size.height * 0.11,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(
//                              MediaQuery.of(context).size.height * 0.11)),
//                          color: Color.fromARGB(255, 217, 224, 234)),
//                      child: const Center(
//                          child: Icon(
//                        CupertinoIcons.paperplane_fill,
//                        color: Color.fromARGB(255, 211, 79, 79),
//                        size: 48,
//                      )),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.topCenter,
//            child: Padding(
//              padding: EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * 0.55),
//              child: InkWell(
//                borderRadius: BorderRadius.all(
//                    Radius.circular(MediaQuery.of(context).size.height * 0.13)),
//                onTap: () async {
//                  if (await Nearby().askLocationPermission()) {
//                    ini();
//                    Get.to(() => SenderView(a: 0));
//                  } else {
//                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                        content: Text(
//                            "External Storage permissions not granted :(")));
//                  }
//                },
//                child: Container(
//                  height: MediaQuery.of(context).size.height * 0.13,
//                  width: MediaQuery.of(context).size.height * 0.13,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(
//                          MediaQuery.of(context).size.height * 0.13)),
//                      color: Color.fromARGB(255, 140, 170, 220)),
//                  child: Center(
//                    child: Container(
//                      height: MediaQuery.of(context).size.height * 0.11,
//                      width: MediaQuery.of(context).size.height * 0.11,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(
//                              MediaQuery.of(context).size.height * 0.11)),
//                          color: Color.fromARGB(255, 217, 224, 234)),
//                      child: const Center(
//                          child: Icon(
//                        CupertinoIcons.tray_arrow_down_fill,
//                        color: Color.fromARGB(255, 211, 79, 79),
//                        size: 48,
//                      )),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding:
//                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.78),
//            child: Center(
//              child: Container(
//                height: MediaQuery.of(context).size.height * 0.12,
//                width: MediaQuery.of(context).size.width * 0.7,
//                decoration: const BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.all(Radius.circular(10)),
//                ),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: [
//                    Padding(
//                      padding: EdgeInsets.only(
//                        left: MediaQuery.of(context).size.width * 0.08,
//                      ),
//                      child: Center(
//                        child: Column(
//                          children: [
//                            IconButton(
//                                onPressed: () => Get.to(() =>Tabbar()),
//                                icon: const Icon(
//                                  Icons.history,
//                                ),
//                                iconSize:
//                                    MediaQuery.of(context).size.height * 0.05),
//                            "History".text.make(),
//                          ],
//                        ),
//                      ),
//                    ),
//                    SizedBox(
//                      width: MediaQuery.of(context).size.width * 0.008,
//                    ),
//                    Container(
//                      height: MediaQuery.of(context).size.height * 0.07,
//                      width: MediaQuery.of(context).size.width * 0.002,
//                      color: Vx.gray300,
//                    ),
//                    Center(
//                      child: Column(
//                        children: [
//                          IconButton(
//                            onPressed: () {},
//                            icon: Icon(Icons.sd_storage),
//                            iconSize: MediaQuery.of(context).size.height * 0.05,
//                          ),
//                          "Storage Location".text.make(),
//                        ],
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
 
//  void showSnackbar(dynamic a) {
//    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//      content: Text(a.toString()),
//    ));
//  }
// }

