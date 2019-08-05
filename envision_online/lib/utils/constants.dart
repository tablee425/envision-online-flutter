class InputTypes {
  static const String Email = 'Email';
  static const String Password = 'Password';
}

class ProgressDialogTitles {
  static const String USER_LOG_IN = 'Logging In...';
  static const String FETCHING_AREA = 'Fetching Area...';
}

class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;
}

class APIConstants {
  static const String API_BASE_URL = 'http://172.20.49.62';
  static const String API_ENDPOINT_LOGIN = '/api/auth/login';
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
}

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = 'IS_USER_LOGGED_IN';
  static const String USER = 'USER';
}

class AppConfig {
  static const int COMPANY_ID = 13;
}
