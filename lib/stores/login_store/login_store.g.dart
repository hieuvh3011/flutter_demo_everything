// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$usernameAtom = Atom(name: 'LoginStoreBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: 'LoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase');

  @override
  dynamic onChangeUsername(dynamic text) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.onChangeUsername');
    try {
      return super.onChangeUsername(text);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangePassword(dynamic text) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.onChangePassword');
    try {
      return super.onChangePassword(text);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password}
    ''';
  }
}
