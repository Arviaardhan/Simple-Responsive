import 'package:api_alya/controllers/api_controller.dart';
import 'package:api_alya/pages/mobile_page.dart';
import 'package:api_alya/pages/tablet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ApiController layoutController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => layoutController.isMobileLayout.value
            ? MobilePage()
            : TabletPage(),
      ),
    );
  }


}
