import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/master_controller.dart';
import 'package:pos_android/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _validateAuthenticationAndRedirect(context);

    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: Center(
        child: Text('กำลังโหลด...', style: Styles.title),
      ),
    );
  }

  void _validateAuthenticationAndRedirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () {});

    //
    if(!Device.get().isTablet ){
      Get.offAllNamed(Routes.errorDevice);
    }
    else {
      _updateDataFromMaster();
      Get.offAllNamed(Routes.login);
    }
  }

  void _updateDataFromMaster (){
    MasterController masterController = Get.find();
    masterController.updateStatus();
  }
}
