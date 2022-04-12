import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:user_ms_ui/src/buisness-logic/models/apiResponse.dart';
import 'package:user_ms_ui/src/buisness-logic/models/batches.dart';
import 'package:user_ms_ui/src/buisness-logic/models/colleges.dart';
import 'package:http/http.dart' as http;
import 'package:user_ms_ui/src/buisness-logic/models/signupInfo.dart';
import 'package:user_ms_ui/src/buisness-logic/resources/apis.dart';

class SignUpProvier extends ChangeNotifier {
  static AllCollegesModel? loadedData;
   static const header = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin':'*'
  };
  Future<ApiResponse<AllCollegesModel>> getAllColleges() async {
    final uri = Uri.https(userApi, '/user/getAllColleges');
    http.Response resp = await http.get(uri);
    try {
      String data = resp.body;
      if (resp.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(data);
        loadedData = AllCollegesModel.fromMap(jsonData);
        return ApiResponse(loadedData, resp.statusCode,
            jsonDecode(data)['message'], true);
      } else {
        return ApiResponse(
            null, resp.statusCode, jsonDecode(data)['message'], false);
      }
    } catch (e) {
      return ApiResponse(null, resp.statusCode, 'Some internal Error', false);
    }
   
  }

  Future<ApiResponse<AllBatchesModel>> getAllBatches(String cId) async {
    final uri = Uri.https(userApi, '/user/getAllBatches/' + cId);
    http.Response resp = await http.get(uri);
    try {
      String data = resp.body;
      if (resp.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(data);
        return ApiResponse(AllBatchesModel.fromMap(jsonData), resp.statusCode,
            jsonDecode(data)['message'], true);
      } else {
        return ApiResponse(
            null, resp.statusCode, jsonDecode(data)['message'], false);
      }
    } catch (e) {
      return ApiResponse(null, resp.statusCode, 'Some internal Error', false);
    }
  }

  Future<ApiResponse<bool>> signup(SignupData data)async{
    final uri = Uri.https(userApi, '/user/signup/');
    final body = data.toJson();
    http.Response resp = await http.post(uri,body: body,headers:header );
    try {
      String data = resp.body;
      if (resp.statusCode == 200) {
        return ApiResponse(true, resp.statusCode,
            jsonDecode(data)['message'], true);
      } else if(resp.statusCode == 400){
        return ApiResponse(
            false, resp.statusCode, jsonDecode(data)['message'], false);
      }else{
        return ApiResponse(false, resp.statusCode, jsonDecode(data)['message'], false);
      }
    } catch (e) {
      return ApiResponse(false, resp.statusCode, 'Some internal Error', false);
    }
  }
}
