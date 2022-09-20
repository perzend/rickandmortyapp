//c:\flutter\bin\flutter.bat pub run build_runner build --delete-conflicting-outputs
//c:\flutter\bin\flutter.bat pub run build_runner watch --delete-conflicting-outputs

import 'package:validators2/validators.dart';
import 'package:mobx/mobx.dart';
part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final error = FormErrorState();

  @observable
  String name='';

  @observable
  String password='';

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);

  @computed
  bool get isUserCheckPending => usernameCheck.status==FutureStatus.pending;

  @observable
  ObservableFuture<bool> passwordCheck = ObservableFuture.value(true);

  @computed
  bool get isPasswordCheckPending => passwordCheck.status==FutureStatus.pending;

  late List<ReactionDisposer> _disposers;

  void setupValidator(){
    _disposers=[
      reaction((_)=> name,validateUsername),
      reaction((_)=> name,validatePassword),
    ];
  }

  bool validatePassword (String value) {
    error.password = isNull(value)||value.isEmpty ?'Field is required' :null;
    return isNull(value);
  }

  bool validateUsername (String value) {
    error.username = isNull(value)||value.isEmpty ?'Field is required' :null;
    return isNull(value);
  }

  // Future<bool> checkValidPassword(String value) async{
  //   await Future.delayed(const Duration(seconds: 1));
  //   return value.length > 5;
  // }

  // Future validateUsername (String value) async {
  //   if(isNull(value) || value.isEmpty) {
  //     error.username='Введите значение!';
  //   }
  //   try {
  //     usernameCheck=ObservableFuture(checkValidUsername(value));
  //   error.username = null;
  //   final isValid = await usernameCheck;
  //   if (!isValid){
  //   error.username='Слишком короткий логин';
  //   return isValid;
  //   }
  //   } catch(e){
  //   error.username = null;
  //   }
  //   }

// проверка, чтобы логин не был равен admin, но нам пофиг
//     Future<bool> checkValidUsername(String value) async{
//     await Future.delayed(const Duration(seconds: 1));
//     return value.length > 5;
//     }

  void dispose() {
    for (final d in _disposers){
      d();
    }
  }

  bool validateAll(){
    validateUsername(name);
    validatePassword(password);
    return !validateUsername(name) && !validatePassword(password);
  }

}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username='';

  @observable
  String? password='';

  @computed
  bool get hasErrors => username != null ||  password != null;
}

