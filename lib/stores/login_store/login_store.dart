import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:show_off/business_logic/validator.dart';
import 'package:show_off/model/app_response.dart';
import 'package:show_off/model/chat_user.dart';
import 'package:show_off/repository/network/network_dio.dart';
import 'package:show_off/repository/network/network_url.dart';
import 'package:show_off/route/app_route.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  ChatUser currentUser;

  @observable
  ObservableList<ChatUser> listContact;

  @action
  hideLoading() {
    if (isLoading == true) {
      isLoading = false;
    }
  }

  @action
  onChangeUsername(text) {
    emailFormKey.currentState.validate();
  }

  @action
  onChangePassword(text) {
    passwordFormKey.currentState.validate();
  }

  @action
  String validateEmail(String email) {
    String result = '';
    Validator validator = Validator();
    if (email.isEmpty) {
      result = "Email cannot be empty";
    } else if (email.isNotEmpty && !validator.isEmail(email)) {
      result = "Email is incorrect format";
    }
    if (result == '') {
      return null;
    }
    return result;
  }

  @action
  String validatePassword(String password) {
    Validator validator = Validator();
    if (password == '') {
      return "Password cannot be empty";
    } else if (validator.isWeakPassword(password)) {
      return "Weak password";
    }
    return null;
  }

  @action
  void onPressedLoginButton(BuildContext context) {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      print('username = ' + email);
      print('password = ' + password);
      if (validatePassword(password) == null && validateEmail(email) == null) {
        EasyLoading.show(status: 'loading...');
        // loginWithFirebase(email, password, context)
        //     .then((value) => {EasyLoading.dismiss()})
        //     .catchError((onError) => {EasyLoading.dismiss()});
        loginWithServer(email, password, context)
            .then((value) => {EasyLoading.dismiss()})
            .catchError((onError) => {EasyLoading.dismiss()});
      } else {
        emailFormKey.currentState.validate();
        passwordFormKey.currentState.validate();
      }
    } catch (error) {
      print('error onPressedLoginButton = ' + error);
      debugPrintStack();
    }
  }

  @action
  storeUser(Map<String, dynamic> user) {
    currentUser = ChatUser.fromJson(user);
  }

  @action
  deleteUser() {
    currentUser = ChatUser.fromJson({});
  }

  @action
  Future<dynamic> loginWithServer(
      String email, String password, BuildContext context) async {
    try {
      DioNetwork dio = DioNetwork.getInstance();
      Map<String, dynamic> params = {"email": email, "password": password};
      AppResponse appResponse;
      await dio.callPostApi(NetworkUrl.loginUrl, params).then((response) {
        // appResponse = AppResponse.fromJson(response.data),
        // print("app response = " + appResponse.toString())
        appResponse = AppResponse.fromJson(response.data);
        print(appResponse.status);
        if (appResponse.status == 0) {
          Map<String, dynamic> data = appResponse.data;
          storeUser(data);
          Navigator.of(context).pushReplacementNamed(AppRoute.BOTTOM_TAB);
        } else {
          String errorMessage = appResponse.message;
          Widget alertDialog = CupertinoAlertDialog(
            title: new Text("Error"),
            content: new Text(errorMessage),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (BuildContext context) => alertDialog,
          );
        }
      });
      // if (response?.data?.status == 0) {
      //   Navigator.of(context).pushReplacementNamed(AppRoute.BOTTOM_TAB);
      // } else {
      //   String errorMessage = response?.data?.message ?? "some error happened";
      //   AlertDialog alertDialog = AlertDialog(
      //     title: Text("Error"),
      //     content: Text(errorMessage),
      //   );
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => alertDialog,
      //   );
      // }
    } catch (error) {
      print('Error login with server = $error');
      debugPrintStack();
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {},
      );
      Widget alertDialog = CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text(error.toString()),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog,
      );
    }
  }

  void onPressLoginWithGoogle() {
    try {
      _googleSignIn.isSignedIn().then((value) => {
            if (value == true)
              {
                _googleSignIn.signOut().then((value) => _googleSignIn
                    .signIn()
                    .then(
                        (value) => print('Login success: ' + value.toString())))
              }
            else
              {
                _googleSignIn.signIn().then(
                    (value) => print('Login success: ' + value.toString()))
              }
          });

      // _googleSignIn
      //     .signIn()
      //     .then((value) => print('Login success: ' + value.toString()));
    } catch (error) {
      print("Login failed: " + error.toString());
    }
  }
}
