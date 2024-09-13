/*
 *
 * Created by Vikrant Patil on 23/01/24, 2:15 pm
 * Copyright (c) 2024 . All rights reserved.
 * Last modified 23/01/24, 3.10 pm
 *
 *
 */

import '../../domain/network/endpoints/endpoints.dart';
import 'constants.dart';

class Utils {
  Utils._();

  static bool checkIfNotNull(dynamic value) {
    return value != null;
  }

  static bool isApiSuccessful(Map<String, dynamic> responseData) {
    return responseData.containsKey(Constants.apiCallStatus) &&
        responseData[Constants.apiCallStatus];
  }

  static bool isAPISuccessfulViaStatusCode({required int statusCode}) {
    return statusCode >= Endpoints.minSuccessStatusCode &&
        statusCode <= Endpoints.maxSuccessStatusCode;
  }

  static bool isAPISuccsessful({required dynamic responseData}) {
    return responseData is Map &&
        responseData.containsKey(Constants.apiCallStatus) &&
        responseData[Constants.apiCallStatus];
  }
}
