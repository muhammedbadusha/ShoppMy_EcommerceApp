import 'dart:convert';

import 'package:http/http.dart';
import 'package:orgfirstproject/ModelClasses/AllProductModel.dart';
import 'package:orgfirstproject/Repository/api_client.dart';


class ProductApi{
  ApiClient apiClient =ApiClient();
  final String path='/products';
  Future <List<AllProductModel>> allProductFunction()async{
    Response response=await apiClient.invokeAPI(path, 'GET', null);
    return AllProductModel.listFromJson(jsonDecode(response.body));
  }
  Future <AllProductModel> idProductFunction()async{
    Response response =await apiClient.invokeAPI(path, "GET", null);
    return AllProductModel.fromJson(response.body);
  }
}
