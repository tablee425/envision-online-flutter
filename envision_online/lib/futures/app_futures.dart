import 'dart:async';
import 'dart:convert';
import 'package:envision_online/models/ApiRequest_User.dart';
import 'package:envision_online/models/ApiRequest_Area.dart';
import 'package:envision_online/models/ApiResponse_User.dart';
import 'package:envision_online/models/EventObject.dart';
import 'package:envision_online/models/AreaObject.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:envision_online/models/User.dart';

//////////////////////////////// User Login API ////////////////////////////////////////////////////////////////////////////////////////////////////////
Future<EventObject> loginUser(String email, String password, bool remember_me) async {
  ApiRequest_User apiRequest = new ApiRequest_User();

  apiRequest.email = email;
  apiRequest.password = password;
  apiRequest.remember_me = remember_me;

  try {
    final response = await http.post(APIConstants.API_BASE_URL + APIConstants.API_ENDPOINT_LOGIN, body: json.encode(apiRequest.toJson()), headers: {'content-type': "application/json"},);
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK && response.body != null) {
        final responseJson = json.decode(response.body);
        ApiResponse_User apiResponse = ApiResponse_User.fromJson(responseJson);
        if (apiResponse.success == APIOperations.SUCCESS) {
          return new EventObject(id: EventConstants.LOGIN_USER_SUCCESSFUL, object: new User(name: apiResponse.name, token: apiResponse.token, user_id: apiResponse.user_id));
        } else {
          return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject();
  }
}

//////////////////////////////// Fetch Area API ////////////////////////////////////////////////////////////////////////////////////////////////////////
Future<AreaObject> fetchArea(int company_id, int user_id) async {
  ApiRequest_Area apiRequest = new ApiRequest_Area();

  apiRequest.company_id = company_id;
  apiRequest.user_id = user_id;

  try {
    final response = await http.post(APIConstants.API_BASE_URL + APIConstants.API_ENDPOINT_FETCH_AREA, body: json.encode(apiRequest.toJson()), headers: {'content-type': "application/json"},);
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK && response.body != null) {
        final responseJson = json.decode(response.body);
        return new AreaObject(id: EventConstants.FETCH_AREA_SUCCESSFUL, object: responseJson);
      } else {
        return new AreaObject(id: EventConstants.FETCH_AREA_UN_SUCCESSFUL);
      }
    } else {
      return new AreaObject();
    }
  } catch (Exception) {
    return AreaObject();
  }
}
