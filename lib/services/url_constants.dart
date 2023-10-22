class AppUrl {
  static const String _domain = 'https://localhost:7296';
  //User
  static const String _userEndpointRoot = '/api/User/';
  static const String _verify = '${_userEndpointRoot}verifyWithOTP';
  static const String _register = '${_userEndpointRoot}CreateUser';
  static const String _confirmEmail = '${_userEndpointRoot}ConfirmMail';
  static const String _requestUpdateNumberOTP =
      '${_userEndpointRoot}requestPhoneNumberCode';
  static const String _confirmPhoneNumberAsyncUpdate =
      '${_userEndpointRoot}updatePhoneNumber';
  static const String _forgotPassword =
      '${_userEndpointRoot}resetPassword';
  static const String _updatePassword =
      '${_userEndpointRoot}updatePassword';

//Account
  //Account
  static const String _accountEndpointRoot = '/api/User/';
  static const String _login = '${_accountEndpointRoot}Login';
  static const String _deleteUserAccount =
      '${_accountEndpointRoot}DeleteUserAccount';

//Terms and Conditions
  static const String _termsEndPointRoot = '/api/TermsAndConditions/';
  static const String _getTerms = '${_termsEndPointRoot}getCurrent';

  //Articles
  static const String _articleEndPointRoot = '/api/Flights/';
  static const String _getFlights = '${_articleEndPointRoot}getFlights';
  static const String _deleteFlights = '${_articleEndPointRoot}deleteFlight';
  static const String _addFlights = '${_articleEndPointRoot}AddFlight';
  static const String _getFlight = '${_articleEndPointRoot}getFlight';
  static const String _editFight = '${_articleEndPointRoot}editFlight';

//Callers
  static const String getTerms = _domain + _getTerms;
    static const String verify = _domain + _verify;
  static const String register = _domain + _register;
  static const String confirmEmail = _domain + _confirmEmail;
  static const String login = _domain + _login;
  static const String forgotPassword = _domain + _forgotPassword;
  static const String confirmPhoneNumberAsyncUpdate =
      _domain + _confirmPhoneNumberAsyncUpdate;
  static const String requestUpdateNumberOTP =
      _domain + _requestUpdateNumberOTP;
  static const String deleteUserAccount = _domain + _deleteUserAccount;
  static const String updatePassword = _domain + _updatePassword;
  static const String getFlights = _domain + _getFlights;
  static const String deleteFlight = _domain + _deleteFlights;
  static const String editFlight = _domain + _editFight;
  static const String addFlight = _domain + _addFlights;
  static const String getFlight = _domain + _getFlight;

}