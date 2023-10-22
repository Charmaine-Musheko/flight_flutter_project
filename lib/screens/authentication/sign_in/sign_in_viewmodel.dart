
import 'package:flight_reminder/base/base_view_model.dart';
import 'package:flight_reminder/database/model/entities/user.dart';
import 'package:flight_reminder/database/repositories/results/login_result.dart';
import 'package:flight_reminder/database/repositories/state/state_repository.dart';
import 'package:flight_reminder/database/repositories/user_repository/user_repository.dart';
import 'package:flight_reminder/utils/encryption_util.dart';

class SignInViewModel extends BaseViewModel {

  final UserRepository _repo;
  final StateRepository _stateRepo;
  final EncryptionUtil encryptionUtil;

SignInViewModel({required UserRepository userRepository,
      required StateRepository stateRepository,
      required EncryptionUtil encryptionUtils})
      :_repo = userRepository,
      _stateRepo = stateRepository,
      encryptionUtil = encryptionUtils;

  Future<LoginResult> login(String email, String password) async {
    //Notify listeners to add loading view
    viewIsLoading(true);

    _stateRepo.isLoggingOut = false;

    LoginResult result = await _repo.login(email, password);

    //Notify listeners to remove loading view
    viewIsLoading(false);

    return result;
  }

  Future<int> insertUser(
      int id,
      String firstName,
      String lastName,
      String email,
    String password,
    String address,
     // bool isEmailConfirmed
      ) async {
    viewIsLoading(true);


  
      var result = await _repo.insertUser(User(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          address: address,
          password: password
         
          
          //isEmailConfirmed: isEmailConfirmed
          ));
          viewIsLoading(false);
          return result;
    
  }

  Future<User?> updateProfile(int id,  String email, ) async {
    viewIsLoading(true);

    var result =
        await _repo.updateProfile(id,  email);

    viewIsLoading(false);

    return result;
  }

  void setDidLogin() {
    _stateRepo.setDidLogin();
  }
}
