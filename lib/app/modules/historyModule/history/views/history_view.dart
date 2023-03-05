import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.08,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: <Color>[
                        Color.fromARGB(255, 77, 133, 230),
                        Color.fromARGB(255, 5, 79, 205)
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Center(
                        child: TextView(
                          text: Strings.storageLocation,
                          color: Colors.white,
                          size: 21,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.13,
                      )
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      );
  }
}
