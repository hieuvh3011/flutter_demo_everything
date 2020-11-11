import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobx/mobx.dart';
import 'package:show_off/business_logic/validator.dart';
import 'package:show_off/route/app_route.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  showLoading() {
    if (isLoading == false) {
      isLoading = true;
    }
  }

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
  onPressedLoginButton(BuildContext context) {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      showLoading();
      EasyLoading.show(status: 'loading...');
      print('username = ' + email);
      print('password = ' + password);
      // if (validatePassword(password) == null && validateEmail(email) == null) {
      //   Navigator.of(context).pushReplacementNamed(AppRoute.BOTTOM_TAB);
      // } else {
      //   emailFormKey.currentState.validate();
      //   passwordFormKey.currentState.validate();
      // }
      Future.delayed(Duration(seconds: 2), () {
        EasyLoading.dismiss();
      });
    } catch (error) {
      print('error onPressedLoginButton = ' + error);
      debugPrintStack();
    }
  }
}
