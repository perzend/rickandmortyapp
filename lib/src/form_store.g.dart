// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  Computed<bool>? _$isUserCheckPendingComputed;

  @override
  bool get isUserCheckPending => (_$isUserCheckPendingComputed ??=
          Computed<bool>(() => super.isUserCheckPending,
              name: '_FormStore.isUserCheckPending'))
      .value;
  Computed<bool>? _$isPasswordCheckPendingComputed;

  @override
  bool get isPasswordCheckPending => (_$isPasswordCheckPendingComputed ??=
          Computed<bool>(() => super.isPasswordCheckPending,
              name: '_FormStore.isPasswordCheckPending'))
      .value;

  late final _$nameAtom = Atom(name: '_FormStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormStore.password', context: context);

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

  late final _$usernameCheckAtom =
      Atom(name: '_FormStore.usernameCheck', context: context);

  @override
  ObservableFuture<bool> get usernameCheck {
    _$usernameCheckAtom.reportRead();
    return super.usernameCheck;
  }

  @override
  set usernameCheck(ObservableFuture<bool> value) {
    _$usernameCheckAtom.reportWrite(value, super.usernameCheck, () {
      super.usernameCheck = value;
    });
  }

  late final _$passwordCheckAtom =
      Atom(name: '_FormStore.passwordCheck', context: context);

  @override
  ObservableFuture<bool> get passwordCheck {
    _$passwordCheckAtom.reportRead();
    return super.passwordCheck;
  }

  @override
  set passwordCheck(ObservableFuture<bool> value) {
    _$passwordCheckAtom.reportWrite(value, super.passwordCheck, () {
      super.passwordCheck = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
password: ${password},
usernameCheck: ${usernameCheck},
passwordCheck: ${passwordCheck},
isUserCheckPending: ${isUserCheckPending},
isPasswordCheckPending: ${isPasswordCheckPending}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$usernameAtom =
      Atom(name: '_FormErrorState.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorState.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
