
import 'package:flight_reminder/database/repositories/terms_repository.dart/terms_result.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/services/i_http_client.dart';
import 'package:flight_reminder/services/url_constants.dart';

class TermsRepository {
  
  final IHttpClient _client = locator<IHttpClient>();

  Future<TermsResult> get() async {
     return await _client.getTermsAndConditions(url: AppUrl.getTerms);
  }
}