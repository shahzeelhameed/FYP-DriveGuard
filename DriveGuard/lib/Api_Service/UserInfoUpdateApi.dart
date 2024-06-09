import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bro/screens/UserProfile.dart';
import 'package:bro/screens/bottoNavigation.dart';
import 'package:bro/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserUpdateInfoApi {
  UserUpdateInfoApi();
  void userUpdateInfo(
      BuildContext context, Map<String, dynamic> requestBody) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString('user_id').toString();
    try {
      final response = await http.put(
          Uri.parse('http://localhost:3000/api/updateUserInfo/$userid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(requestBody));

      if (response.statusCode == 200) {
        print("Succesfull");
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Your Info Updated',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          btnOkOnPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BotttomNavigationScreen(),
                ));
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Some Error Occured',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          btnOkColor: Colors.red,
          btnOkOnPress: () {},
        ).show();
      }
    } catch (error) {
      print(error);
    }
  }

  void deleteAccount(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user_id = prefs.getString('user_id').toString();

      final response = await http
          .delete(Uri.parse('http://localhost:3000/api/deleteUser/$user_id'));

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('user_id');

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Your Account is deleted Successfully',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          transitionAnimationDuration: const Duration(seconds: 2),
          onDismissCallback: (type) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
        ).show();
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }

  void changePassword(BuildContext context, String currentPassword,
      String confirmPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('user_id').toString();

    var requestBody = {
      'currentPassword': currentPassword,
      'confirmPassword': confirmPassword
    };

    try {
      final response = await http.put(
          Uri.parse('http://localhost:3000/api/changePassword/$user_id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(requestBody));

      if (response.statusCode == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Your password is changed',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          transitionAnimationDuration: const Duration(seconds: 2),
          onDismissCallback: (type) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BotttomNavigationScreen(),
                ));
          },
        ).show();
      } else if (response.statusCode == 400) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Current password not valid',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          transitionAnimationDuration: const Duration(seconds: 2),
        ).show();
      } else if (response.statusCode == 401) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'New password cannot be the same as the current password',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          transitionAnimationDuration: const Duration(seconds: 2),
        ).show();
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }
}
