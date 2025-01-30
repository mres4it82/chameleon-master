import 'package:chameleon/global/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language_controller.dart';

class LanguageUtils {
  static bool isRtl() {
    // الحصول على LanguageController باستخدام Get.find
    LanguageController languageController = Get.find<LanguageController>();
    return languageController.isArabic ||
        languageController.isUrdo ||
        languageController.isHindi;
  }

  static TextDirection getTextDirection() {
    return isRtl() ? TextDirection.rtl : TextDirection.ltr;
  }

  static CrossAxisAlignment getCrossAxisAlignment() {
    return isRtl() ? CrossAxisAlignment.start : CrossAxisAlignment.end;
  }
}


enum MessageType {
  Success, // 0
  Failed,
}



class ShowMessage{
  static void showSuccessBottomSheet(int messageType,String textMessage) {


    Color colorMessage = messageType == MessageType.Success.index ? Colors.green : Colors.red;


    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: colorMessage,
        constraints: BoxConstraints(
          maxHeight: 100,
        ),
        child: Center(
          child: Text(textMessage,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      isDismissible: true,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            0),
      ),
    );

    Future.delayed(Duration(seconds: 1), () {
      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
    });
  }
}

class ColorFromHex {
  static Color colorFromHex(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      return boxColor;
    }

    hexColor = hexColor.replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    if (hexColor.length != 8) {
      return boxColor;
    }

    try {
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      return boxColor;
    }
  }
}


