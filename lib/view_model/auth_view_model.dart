import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/respository/auth_repositry.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo=AuthRepositry();

  bool _loading = false;
  bool get loading=>_loading;

  bool _signUpLoading =false;
  bool get signUpLoading=>_signUpLoading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context)async{
    setLoading(true);
  _myRepo.loginApi(data).then((value) {
    setLoading(false);
    Utils.flushBarErrorMessage('Login Successfully', context);
    Navigator.pushNamed(context, RoutesName.home);
    if (kDebugMode) {
      print(value.toString());
    }
  }).onError((error, stackTrace) {
    setLoading(false);
    if (kDebugMode) {
      Utils.flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    }

  });
  }

  Future<void> signUpApi(dynamic data,BuildContext context)async{
    setLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }
}