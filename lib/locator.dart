

import 'package:flight_reminder/database/data_repositories/user_data_repository.dart';
import 'package:flight_reminder/database/database_provider.dart';
import 'package:flight_reminder/database/repositories/state/state_repository.dart';
import 'package:flight_reminder/database/repositories/user_repository/user_repository.dart';
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_viewmodel.dart';
import 'package:flight_reminder/screens/authentication/sign_up/sign_up_view_model.dart';
import 'package:flight_reminder/screens/flights/flight_view_model.dart';
import 'package:flight_reminder/services/http_client.dart';

import 'package:flight_reminder/services/i_http_client.dart';
import 'package:flight_reminder/utils/encryption_util.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';

import 'screens/onboarding/onboarding_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

EventBus eventBus = EventBus();

void setup() {
  // Register all the required view models
  locator.registerFactory(() => OnboardingViewModel());
  locator.registerFactory(() => SignInViewModel(
        userRepository: locator<UserRepository>(),
        stateRepository: locator<StateRepository>(),
        encryptionUtils: locator<EncryptionUtil>(),
      ));
  locator.registerFactory(() => SignUpViewModel(
      userRepository: locator<UserRepository>(),
      stateRepository: locator<StateRepository>()));

  locator.registerFactory<EncryptionUtil>(() => EncryptionUtil());
  locator.registerFactory<FlightViewModel>(() =>  FlightViewModel());
   // locator.registerFactory<HomeScreenViewModel>(() => HomeScreenViewModel());
  ////  locator.registerFactory<CommentsViewModel>(() => CommentsViewModel());

    //Services
  locator.registerLazySingleton<IHttpClient>(() => HttpClient());
  locator.registerLazySingleton(() => DatabaseProvider());
  
 //Repositories
  locator.registerLazySingleton(() => UserRepository(
      httpClient: locator<IHttpClient>(),
      userDataRepository: locator<UserDataRepository>(),
      encryptionUtil: locator<EncryptionUtil>()));
        locator.registerLazySingleton(() => StateRepository(
      prefs: SharedPreferences.getInstance(),
      userRepository: locator<UserRepository>(),
      databaseProvider: locator<DatabaseProvider>()));


        //Data repositories
  locator.registerLazySingleton(
      () => UserDataRepository(dbProvider: locator<DatabaseProvider>()));
}