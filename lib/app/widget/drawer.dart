import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key, required this.modelname}) : super(key: key);

  String modelname;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Vx.blue100,
      child: ListView(
        children: <Widget>[
          Container(
            height: Get.height * 0.25,
            width: Get.width * 0.9,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                  Color.fromARGB(255, 203, 222, 255),
                  Color.fromARGB(255, 127, 165, 231),
                  Color.fromARGB(255, 77, 133, 230),
                  Color.fromARGB(255, 29, 103, 231),
                  Color.fromARGB(255, 32, 98, 213),
                  Color.fromARGB(255, 7, 53, 132),
                ])),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, left: Get.width * .05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                      splashColor: Vx.blue200,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/avatar/avatar5.png"),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    const Text(
                      'UserName',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                      splashColor: Vx.blue200,
                      child: const Text(
                        'nikhil',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 5,
            color: Vx.blue300,
          ),
          ListTile(
            leading: Icon(Icons.share,
                color: Colors.black, size: Collection.diagonal * 0.04),
            title: Text("Share"),
            selectedColor: Vx.gray500,
            onTap: () {},
          ),
          ListTile(
            title: Text("Rate Us"),
            leading: Icon(
              Icons.star,
              color: Vx.yellow600,
              size: Collection.diagonal * 0.045,
            ),
            selectedColor: Vx.black,
            onTap: () {},
          ),
          ListTile(
            title: Text("Contact Us"),
            leading: Icon(Icons.contact_support,
                color: Colors.black, size: Collection.diagonal * 0.04),
            onTap: () {},
          ),
          ListTile(
            title: Text("About Us"),
            leading: Icon(Icons.info_outline,
                color: Colors.black, size: Collection.diagonal * 0.04),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
