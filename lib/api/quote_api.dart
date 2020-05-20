import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tata/api/entites/quote.dart';

import "api_path.dart";

class QuoteApi {
  static Future<dynamic> getEveryDayQuote() async {
    print("begin to get quote for everyday");
    var isError = false;
   
    Response response = await Dio().get(ApiPath.quoteEveryDay).catchError((_){
      isError = true;
    });
    String quote;
    if(!isError) {
      quote = response.data["translation"];
    }
    return isError ? true : quote;
    
  }
}