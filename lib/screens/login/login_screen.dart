import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/stores/login_store/login_store.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore _loginStore = LoginStore();

  final LocalAuthentication _auth = LocalAuthentication();

  bool _canCheckBiometrics;

  List<BiometricType> _availableBiometrics = List();

  String _authorized = 'Not Authorized';

  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await _auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print("Authenticating error: " + e.toString());
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    _auth.stopAuthentication();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                height: 40.0,
              ),
              ButtonTheme(
                height: 50.0,
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
              SizedBox(
                height: 40.0,
              ),
              ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    _loginStore.onPressLoginWithGoogle();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.redAccent[100],
                  child: const Center(
                    child: Text(
                      'Login with Google',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              _renderBiometric(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderBiometric(BuildContext context) {
    print("_availableBiometrics = $_availableBiometrics");
    if (_availableBiometrics.length != 0) {
      return GestureDetector(
        onTap: () {
          _authenticate()
              .then((value) => {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoute.BOTTOM_TAB)
                  })
              .catchError((error, stackTrace) {
            print('error: ' + error.toString());
            print('stackTrace: ' + stackTrace.toString());
            Sentry.captureException(
              error,
              stackTrace: stackTrace,
            );
          });
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 40.0,
          ),
          height: 50.0,
          child: Icon(
            Icons.fingerprint,
            size: 50.0,
          ),
        ),
      );
    }
    return Container();
  }
}
