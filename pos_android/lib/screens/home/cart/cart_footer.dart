import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/routes/app_pages.dart';
import 'package:pos_android/widgets/buttons/button_cancel.dart';
import 'package:pos_android/widgets/buttons/button_success.dart';
import 'package:pos_android/widgets/modal_widget.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonCancel(
            'ยกเลิกการขาย',
            onClicked: () {
              Get.dialog(const ModalWidget(
                icon: 'warning',
                title: 'ขออภัย!!',
                text: 'ไม่พบรายการสินค้า',
                doneText: 'ตกลง',
                isCancel: false,
              ));
            },
            style: Styles.buttonCancel.copyWith(fontSize: Styles.fontSizeLarge),
          ),
        ),
        const SizedBox(width: Styles.padding / 2),
        Expanded(
          child: ButtonSuccess(
            'ชำระเงิน',
            onClicked: () {
              FirebaseAnalytics.instance.logEvent(
                name: 'payment',
                parameters: {'type': 'ชำระเงิน'},
              );

              Get.toNamed(Routes.payment);
            },
            style:
                Styles.buttonPrimary.copyWith(fontSize: Styles.fontSizeLarge),
          ),
        ),
      ],
    );
  }
}
