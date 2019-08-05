class InputTypes {
  static const String Email = 'Email';
  static const String Password = 'Password';
  static const String Operator = 'Operator';
}

class ProgressDialogTitles {
  static const String USER_LOG_IN = 'Logging In...';
  static const String FETCHING_AREA = 'Fetching Area...';
  static const String FETCHING_FIELD = 'Fetching Field...';
}

class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

  static const int FETCH_AREA_SUCCESSFUL = 502;
  static const int FETCH_AREA_UN_SUCCESSFUL = 503;

  static const int FETCH_FIELD_SUCCESSFUL = 504;
  static const int FETCH_FIELD_UN_SUCCESSFUL = 505;
}

class APIConstants {
  static const String SERVER_TYPE = 'DEV_';
  static const String API_BASE_URL = SERVER_TYPE == 'DEV' ? 'http://172.20.49.62' : 'https://dev1envision.prodesy.com';
  static const String API_ENDPOINT_LOGIN = '/api/auth/login';
  static const String API_ENDPOINT_FETCH_AREA = '/api/area/fetch';
  static const String API_ENDPOINT_FETCH_FIELD = '/api/field/fetch';
}

class APIResponseCode {
  static const int SC_OK = 200;
}

class APIOperations {
  static const bool SUCCESS = true;
  static const bool FAILURE = false;
}

class SnackBarTexts {
  static const String ENTER_EMAIL = 'Please Enter your Email';
  static const String ENTER_PASS = 'Please Enter your Password';
  static const String NO_AREA = 'Not Found any Area';
}

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = 'IS_USER_LOGGED_IN';
  static const String USER = 'USER';
}

class AppConfig {
  static const int COMPANY_ID = 13;
}
