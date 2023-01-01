import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_h/app/routes/app_pages.dart';
import 'package:share_h/app/strings/string.dart';
import 'package:share_h/app/widget/textview.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
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
                          Get.offNamed(Routes.MENU_PAGE);
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
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.09),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  AssetImage(controller.currentAvatar)),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: controller.userName,
                              cursorColor: Colors.black,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: 'Username', icon: Icon(Icons.edit)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemCount: controller.avatarUrl.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.setImageString(
                                        controller.avatarUrl[index]);
                                    ;
                                  },
                                  child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          controller.avatarUrl[index])),
                                ),
                              );
                            },
                          ),
                        ),
                        //Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0, left: 25, right: 25),
                          child: GestureDetector(
                            onTap: () {
                              controller.upadateData(controller.currentAvatar,
                                  controller.userName.text);
                            },
                            child: Container(
                              width: Get.width,
                              height: 60,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: <Color>[
                                        Color.fromARGB(255, 77, 133, 230),
                                        Color.fromARGB(255, 5, 79, 205)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              child: Center(
                                child: TextView(
                                  text: Strings.update,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
