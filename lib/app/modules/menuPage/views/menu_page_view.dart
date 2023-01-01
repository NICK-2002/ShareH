import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_h/app/data/collection.dart';
import 'package:share_h/app/routes/app_pages.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/menu_page_controller.dart';

class MenuPageView extends GetView<MenuPageController> {
  const MenuPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuPageController>(
      builder: (controller) {
        return Scaffold(
            body: Container(
          color: Vx.blue100,
          child: ListView(
            children: <Widget>[
              Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
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
                                text: Strings.upadateprofile,
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
                      InkWell(
                        onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                        splashColor: Vx.blue200,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(controller.url),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      Text(
                        Strings.user_Name,
                        style: const TextStyle(
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
                        child: Text(
                          controller.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
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
                title: Text(Strings.rate_Us),
                leading: Icon(
                  Icons.star,
                  color: Vx.yellow600,
                  size: Collection.diagonal * 0.045,
                ),
                selectedColor: Vx.black,
                onTap: () {},
              ),
              ListTile(
                title: Text(Strings.contact_Us),
                leading: Icon(Icons.contact_support,
                    color: Colors.black, size: Collection.diagonal * 0.04),
                onTap: () {},
              ),
              ListTile(
                title: Text(Strings.about_Us),
                leading: Icon(Icons.info_outline,
                    color: Colors.black, size: Collection.diagonal * 0.04),
                onTap: () {},
              ),
            ],
          ),
        ));
      }
    );
  }
}
