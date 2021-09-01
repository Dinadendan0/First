import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
static Dio dio ;

static init()
{
  dio =Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ),
  );
}
static Future<Response<dynamic>> getData({
  @required String url ,
  Map<String, dynamic> query,
  String lang = 'en',
  String token,
})async
 {
   dio.options.headers =
   {
     'Content-Type':'application/json',
     'lang':lang,
     'Authorization': token??'',
   };
  return await dio.get(
    url,
    queryParameters: query,
  );
 }

 static Future<Response<dynamic>> postData({
   @required String url ,
   Map<String, dynamic> query,
   @required Map<String, dynamic> data,
   String lang = 'en',
   String token,
 }) async
 {
   dio.options.headers =
   {
     'Content-Type':'application/json',
     'lang':lang,
     'Authorization': token??'' ,
   };
   return await dio.post(
     url,
     queryParameters: query,
     data: data,
   );
 }


static Future<Response<dynamic>> putData({
  @required String url ,
  Map<String, dynamic> query,
  @required Map<String, dynamic> data,
  String lang = 'en',
  String token,
}) async
{
  dio.options.headers =
  {
    'Content-Type':'application/json',
    'lang':lang,
    'Authorization': token??'' ,
  };
  return await dio.put(
    url,
    queryParameters: query,
    data: data,
  );
}

}






// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca




//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca


