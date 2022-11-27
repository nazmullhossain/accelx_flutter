import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/api.dart';
import '../pages/home_page.dart';
import '../pages/test.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  Future<void> loginWithEmail() async {
    try {
      var response = await http.post(
          Uri.parse('https://awesome-chatting-app.herokuapp.com/api/user/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            // "name": emailController.text,
            "email": emailController.text,
            'password': passwordController.text

          }));
      print("responst data ${response.body}");
      if(response.statusCode==200){

        Get.off(Home());

        Fluttertoast.showToast(
            msg: "Your Login is successfuly",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 10,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );


        // final json = jsonDecode(response.body);
        // if (json['code'] == 0) {
        //   var token = json['data']['Token'];
        //   final SharedPreferences? prefs = await _prefs;
        //   await prefs?.setString('token', token);
        //
        //   emailController.clear();
        //   passwordController.clear();
        //   Get.off(Home());
        // }
        // else if (json['code'] == 1) {
        //   throw jsonDecode(response.body)['message'];
        // }

      }
      else{
        // throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
        Fluttertoast.showToast(
            msg: "Email and password wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }


    } catch (error) {
      print(error.toString());
    }
  }








  // Future<void> loginWifthEmail() async {
  //   var headers = {'Content-Type': 'application/json'};
  //   try {
  //     var url = Uri.parse(
  //         ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
  //     Map body = {
  //       'email': emailController.text.trim(),
  //       'password': passwordController.text
  //     };
  //     http.Response response =
  //     await http.post(url, body: jsonEncode(body), headers: headers);
  //
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       if (json['code'] == 0) {
  //         var token = json['data']['Token'];
  //         final SharedPreferences? prefs = await _prefs;
  //         await prefs?.setString('token', token);
  //
  //         emailController.clear();
  //         passwordController.clear();
  //         Get.off(Home());
  //       }
  //
  //       else if (json['code'] == 1) {
  //         throw jsonDecode(response.body)['message'];
  //       }
  //     } else {
  //       throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
  //     }
  //   } catch (error) {
  //     Get.back();
  //     showDialog(
  //         context: Get.context!,
  //         builder: (context) {
  //           return SimpleDialog(
  //             title: Text('Error'),
  //             contentPadding: EdgeInsets.all(20),
  //             children: [Text(error.toString())],
  //           );
  //         });
  //   }
  // }
}
