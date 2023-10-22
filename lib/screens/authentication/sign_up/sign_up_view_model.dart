

import 'package:flight_reminder/base/base_view_model.dart';
import 'package:flight_reminder/database/model/entities/user.dart';
import 'package:flight_reminder/database/repositories/results/registration_result.dart';
import 'package:flight_reminder/database/repositories/results/verify_phone_result.dart';
import 'package:flight_reminder/database/repositories/state/state_repository.dart';
import 'package:flight_reminder/database/repositories/user_repository/user_repository.dart';

class SignUpViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  final StateRepository _stateRepository;

  SignUpViewModel(
      {required UserRepository userRepository,
      required StateRepository stateRepository})
      : _userRepository = userRepository,
        _stateRepository = stateRepository;

void setDidLogin() {
    _stateRepository.setDidLogin();
  }

    Future<RegistrationResult> register(String firstName, String lastName, String email,String address, String password) async {
    //Notify listeners to add loading view
    viewIsLoading(true);

    RegistrationResult result =
        await _userRepository.register(firstName, lastName, email,address, password);

    //Notify listeners to remove loading view
    viewIsLoading(false);

    return result;
  }
  Future<int> insertUser(
      int id,
      String firstName,
      String lastName,
      String address,
      String email,
      String password
      )async {
    viewIsLoading(true);

    

    if (id != 0) {
      var result = await _userRepository.insertUser(User(
          id: id,
          firstName: firstName,
          lastName: lastName,
          address: address,
          email: email,
          password: password,
          
          ));
      viewIsLoading(false);
      return result;
    } else {
      viewIsLoading(false);
      return 0;
    }
  }

}