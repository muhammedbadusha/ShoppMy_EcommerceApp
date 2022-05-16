import 'dart:convert';

import 'package:http/http.dart';
import 'package:orgfirstproject/ModelClasses/AllProductModel.dart';
import 'package:orgfirstproject/ModelClasses/ProductIdModel.dart';
import 'package:orgfirstproject/Repository/api_client.dart';


class ProductApi{
  ApiClient apiClient =ApiClient();
  final String path='/products';
  final String ProductIdPath='/products/';
  Future <List<AllProductModel>> allProductFunction()async{
    Response response=await apiClient.invokeAPI(path, 'GET', null);
    return AllProductModel.listFromJson(jsonDecode(response.body));
  }
  Future <List<ProductIdModel>> idProductFunction(String ProductId)async{
    String id=ProductId;
    Response response =await apiClient.invokeAPI(ProductIdPath+id, 'GET', null);
    print(response.body);
    return ProductIdModel.listFromJson(jsonDecode(response.body));

  }
}
