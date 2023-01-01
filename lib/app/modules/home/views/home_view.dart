import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/modules/connectionPage/views/connection_page_view.dart';
import 'package:share_h/app/routes/app_pages.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: Vx.gray200,
          drawer: MyDrawer(modelname: "nikhil"),
          body: Stack(
            children: [
              Container(
                  height: Get.height * 0.9,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.centerLeft,
                      colors: <Color>[
                        Color.fromARGB(255, 77, 133, 230),
                        Color.fromARGB(255, 5, 79, 205),
                      ],
                      //  tileMode: TileMode.mirror,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2100),
                        bottomRight: Radius.elliptical(10, 20)),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0575,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.line_horizontal_3),
                    onPressed: () async {
                      Get.toNamed(Routes.MENU_PAGE);
                    },
                    iconSize: 29,
                    color: Colors.white,
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Text(
                    Strings.app_Name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.13),
                  child: Text(
                    Strings.app_Moto,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.height * 0.13)),
                    onTap: () async {
                      controller.pageSet(1);
                      controller.ini();
                      Get.toNamed(Routes.CONNECTION_PAGE,
                          arguments: ['Sender']);
                      controller.sender();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.height * 0.13)),
                          color: Color.fromARGB(255, 118, 154, 216)),
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.height * 0.11,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  MediaQuery.of(context).size.height * 0.11)),
                              color: Color.fromARGB(255, 217, 224, 234)),
                          child: const Center(
                              child: Icon(
                            CupertinoIcons.paperplane_fill,
                            color: Color.fromARGB(255, 211, 79, 79),
                            size: 48,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.55),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.height * 0.13)),
                    onTap: () async {
                      controller.pageSet(0);
                      if (await Nearby().askLocationPermission()) {
                        controller.ini();
                        Get.toNamed(Routes.CONNECTION_PAGE,
                            arguments: ['Receive']);
                        controller.receiver();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "External Storage permissions not granted :(")));
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.height * 0.13)),
                          color: Color.fromARGB(255, 140, 170, 220)),
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.height * 0.11,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  MediaQuery.of(context).size.height * 0.11)),
                              color: Color.fromARGB(255, 217, 224, 234)),
                          child: const Center(
                              child: Icon(
                            CupertinoIcons.tray_arrow_down_fill,
                            color: Color.fromARGB(255, 211, 79, 79),
                            size: 48,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.78),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.08,
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.HISTORY),
                                    icon: const Icon(
                                      Icons.history,
                                    ),
                                    iconSize:
                                        MediaQuery.of(context).size.height *
                                            0.05),
                                Strings.history.text.make(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.008,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.002,
                          color: Vx.gray300,
                        ),
                        Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.sd_storage),
                                iconSize:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Strings.storage_Location.text.make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
