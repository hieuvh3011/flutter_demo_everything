// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$pageAtom = Atom(name: '_HomeStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$limitAtom = Atom(name: '_HomeStore.limit');

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  final _$listUsersAtom = Atom(name: '_HomeStore.listUsers');

  @override
  ObservableList<User> get listUsers {
    _$listUsersAtom.reportRead();
    return super.listUsers;
  }

  @override
  set listUsers(ObservableList<User> value) {
    _$listUsersAtom.reportWrite(value, super.listUsers, () {
      super.listUsers = value;
    });
  }

  final _$getListUserAsyncAction = AsyncAction('_HomeStore.getListUser');

  @override
  Future<List<User>> getListUser() {
    return _$getListUserAsyncAction.run(() => super.getListUser());
  }

  final _$saveListUserToLocalDatabaseAsyncAction =
      AsyncAction('_HomeStore.saveListUserToLocalDatabase');

  @override
  Future<void> saveListUserToLocalDatabase(List<User> listUsers) {
    return _$saveListUserToLocalDatabaseAsyncAction
        .run(() => super.saveListUserToLocalDatabase(listUsers));
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
listUsers: ${listUsers}
    ''';
  }
}
