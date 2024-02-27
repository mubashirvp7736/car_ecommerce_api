class UserModel{

String?name;
String? username;
String? email;
String? password;
UserModel({ this.username, this.email, this.password ,this.name});



Map<String,dynamic>toJson(){
  // ignore: prefer_collection_literals
  final Map<String,dynamic>userInfo= Map<String,dynamic>();
  userInfo["name"]=name;
  userInfo['username']=username;
  userInfo["email"]=email;
  userInfo['password']=password;
  return userInfo;
}
}