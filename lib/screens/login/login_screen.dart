import 'package:flutter/material.dart';
import 'package:show_off/screens/common/loading.dart';
import 'package:show_off/stores/login_store/login_store.dart';
import 'package:show_off/utils/app_size.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore _loginStore = LoginStore();
  final AppSize _appSize = AppSize.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _appSize.scale(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _loginStore.emailFormKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'johndoe@example.com',
                    labelText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (email) {
                    _loginStore.onChangeUsername(email);
                  },
                  controller: _loginStore.emailController,
                  validator: (value) {
                    return _loginStore.validateEmail(value);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: _loginStore.passwordFormKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: '**************',
                    labelText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  obscureText: true,
                  onChanged: (password) {
                    _loginStore.onChangePassword(password);
                  },
                  controller: _loginStore.passwordController,
                  validator: (value) {
                    return _loginStore.validatePassword(value);
                  },
                ),
              ),
              SizedBox(
                height: _appSize.scale(40.0),
              ),
              ButtonTheme(
                height: _appSize.scale(50.0),
                child: RaisedButton(
                  onPressed: () {
                    _loginStore.onPressedLoginButton(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.orangeAccent,
                  child: const Center(
                    child: Text(
                      'Login',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
