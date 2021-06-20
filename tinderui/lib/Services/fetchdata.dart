import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:convert';
Future<dynamic> getUserData()async{
  try{
  var response=await Dio().get("https://randomuser.me/api/");
  final Map<String, dynamic> parsed = json.decode(response.toString());
  return parsed;
  }on DioError catch(e)
  {
    if(e.type==DioErrorType.other)
      {
        return "network";
      }
  }
  catch (e)
  {
  }
}