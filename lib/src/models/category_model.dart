class CategoryModel{
 final String? id;
  String categoryName;
  String categoryCode;

  CategoryModel({ this.id,required this.categoryName,required this.categoryCode});

 factory CategoryModel.fromJSON(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json["categoryName"],
     categoryCode: json["categoryCode"],
     id: json["_id"]
    );
  }
//setCategoryName(String categoryName){
   //this.categoryName= categoryName;
//}
 Map<String, dynamic> toJson() {
  final map =<String,dynamic>{};

     map[ 'categoryName']= categoryName;
   map[  'categoryCode']= categoryCode;
   return map;
    }
  }

//
//

