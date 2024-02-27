import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/service/store_services.dart';
import 'package:ecommerce/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

TextEditingController nameCntroller=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController usernameController=TextEditingController();
TextEditingController passwordController=TextEditingController();



final UserServices _userServices=UserServices();
final StoreService _storeService=StoreService();

String? userStatusCode;
String? createdStatusCode;

String username='';
String password='';

Future<void>createUser(UserModel userInfo)async{
  await _userServices.createUser(userInfo);
  createdStatusCode=_userServices.createdStatusCode;
  notifyListeners();

}
 Future<void> userLogin(UserModel userInfo) async {
    await _userServices.userLogin(userInfo);
    userStatusCode = _userServices.userStatusCode;
    notifyListeners();
  }

  Future<void> setUserData() async {
    username = await _storeService.getValues('username') ?? '';
    password = await _storeService.getValues('password') ?? '';
    notifyListeners();
  }
}


