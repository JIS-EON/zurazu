import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

Color coBlack = Color.fromRGBO(0, 0, 0, 1);
Color coWhite = Color.fromRGBO(255, 255, 255, 1);
Color coMain = Color.fromRGBO(29, 69, 215, 1);
Color coGray = Color.fromRGBO(213, 213, 213, 1);
Color coDividerGray = Color.fromRGBO(163, 163, 163, 1);

void lo(String str) {
  debugPrint("주라주 - $str");
}

/// IMOJI ///
final RegExp REGEX_EMOJI = RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

/// YYYY.MM.DD formatter ///
String dateFormatUtil(String date){
  // yyyy-mm-dd 00:00:00 형식을 yyyy.mm.dd로 바꿔줍니다
  var dateParse = DateTime.parse(date);
  String year = dateParse.year.toString();
  String month = dateParse.month.toString();
  String day = dateParse.day.toString();
  // 필요시 사용
  // String hour = dateParse.hour.toString();
  // String minute = dateParse.minute.toString();
  // String second = dateParse.second.toString();
  return (year + '.' + month + '.'+day);
}

toastUtil(String msg) {
  return Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: coBlack,
      fontSize: 14.0
  );
}

/// API Error codes ///
const successCode = 1000;       //API 정상실행
const dataNotFound = 1001;      //반환받을 값 없음
const notChanged = 1002;        //변경되지 않음(이전과 같거나, 해당하는 row가 없음)
const uploadFailed = 1003;      //업로드 실패
const bannedUser = 1004;        //사용 정지된 유저
const duplicated = 1005;        //중복
const cannotBeModified = 1006;  //수정불가

const emptyParameters = 2000;   //인자 값 비어있음
const invalidParameters = 2001; //인자 값 형식오류
const invalidToken = 2002;      //토큰 없음
const notAuthorized	= 2003;     //권한 없음

const connectionFailure = 3001; //연결 실패
const paymentFailure = 3002;    //결제 실패

const jsonParseError = 4000;    //Body JSON 형식 오류
const notFound = 4001;          //주소를 찾을 수 없음
const somethingBroken = 5000;   //알 수 없는 오류

String msgToken;
Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  return Future<void>.value();
}
