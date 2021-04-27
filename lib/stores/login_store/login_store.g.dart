// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$emailControllerAtom = Atom(name: 'LoginStoreBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: 'LoginStoreBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'LoginStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$currentUserAtom = Atom(name: 'LoginStoreBase.currentUser');

  @override
  ChatUser get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(ChatUser value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$listContactAtom = Atom(name: 'LoginStoreBase.listContact');

  @override
  ObservableList<ChatUser> get listContact {
    _$listContactAtom.reportRead();
    return super.listContact;
  }

  @override
  set listContact(ObservableList<ChatUser> value) {
    _$listContactAtom.reportWrite(value, super.listContact, () {
      super.listContact = value;
    });
  }

  final _$loginWithServerAsyncAction =
      AsyncAction('LoginStoreBase.loginWithServer');

  @override
  Future<dynamic> loginWithServer(
      String email, String password, BuildContext context) {
    return _$loginWithServerAsyncAction
        .run(() => super.loginWithServer(email, password, context));
  }

  final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase');

  @override
  dynamic hideLoading() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.hideLoading');
    try {
      return super.hideLoading();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String validateEmail(String email) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validatePassword(String password) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPressedLoginButton(BuildContext context) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.onPressedLoginButton');
    try {
      return super.onPressedLoginButton(context);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic storeUser(Map<String, dynamic> user) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.storeUser');
    try {
      return super.storeUser(user);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteUser() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.deleteUser');
    try {
      return super.deleteUser();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
isLoading: ${isLoading},
currentUser: ${currentUser},
listContact: ${listContact}
    ''';
  }
}
