import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:show_off/business_logic/validator.dart';
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
        loginWithFirebase(email, password, context)
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

  Future<void> loginWithFirebase(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('user credential = ' + userCredential.toString());
      Navigator.of(context).pushReplacementNamed(AppRoute.BOTTOM_TAB);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
