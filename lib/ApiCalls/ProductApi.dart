import 'dart:convert';

import 'package:http/http.dart';
import 'package:orgfirstproject/ModelClasses/AllProductsModel.dart';
import 'package:orgfirstproject/Repository/api_client.dart';

class ProductApi{
 String path="/products";
  ApiClient apiClient =ApiClient();
  Future <AllProductsModel> allProductsFuction()async{
    Response response=await apiClient.invokeAPI(path, "GET", null);
    print(response.body);
    return AllProductsModel.fromJson(jsonDecode(response.body));
  }
}