import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peruri_app/core/commons/colors_const.dart';

class UIHelper {
  UIHelper._();

  static BorderRadiusGeometry borderRadiusCircular({
    double? all,
    double? top,
    double? bottom,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    topLeft = setSp(topLeft ?? top ?? all ?? 0);
    topRight = setSp(topRight ?? top ?? all ?? 0);
    bottomLeft = setSp(bottomLeft ?? bottom ?? all ?? 0);
    bottomRight = setSp(bottomRight ?? bottom ?? all ?? 0);
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  static EdgeInsets padding({
    double? all,
    double? vertical,
    double? horizontal,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    left = setWidth(left ?? horizontal ?? all ?? 0);
    top = setHeight(top ?? vertical ?? all ?? 0);
    right = setWidth(right ?? horizontal ?? all ?? 0);
    bottom = setHeight(bottom ?? vertical ?? all ?? 0);
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  static double setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static double setSp(double size) {
    return size.sp;
  }

  static double setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static Widget loading({Color? color, double? width, double? height, double? value}) {
    return SizedBox(
      width: width ?? UIHelper.setSp(20),
      height: height ?? UIHelper.setSp(20),
      child: Center(
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? ColorConstant.primary),
        ),
      ),
    );
  }

  static Widget loadingWidget({double? height, Color? color, Color? loadingColor}) {
    return Container(
      height: height ?? UIHelper.setHeight(800),
      color: color ?? ColorConstant.whiteColor,
      child: Center(child: UIHelper.loading(color: loadingColor)),
    );
  }

  static double setFont(double font) {
    return ScreenUtil().setSp(font);
  }

  static double mediaHeight(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * scale;
  }

  static double mediaWidth(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * scale;
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: setHeight(height));
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: setWidth(width));
  }

  static Widget divider({Color? color, double? thickness, double? height}) {
    return Divider(
      color: color,
      thickness: thickness,
      height: height ?? UIHelper.setSp(30),
    );
  }

  static double defaultPadding = 28.0;

  static void showToast(String message, {bool isSuccess = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: isSuccess ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: UIHelper.setFont(14));
  }
}
