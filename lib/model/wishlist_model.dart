class WishListModel{

String? id;

WishListModel({this.id});

Map<String,dynamic>toJson(String token){

  final Map<String,dynamic>data={"product":id};
  final Map<String,String>headers={"Authorization":"bear $token"};
  return{"data":data,"headers":headers};
}
  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      id: json['data'],
    );
  }

}