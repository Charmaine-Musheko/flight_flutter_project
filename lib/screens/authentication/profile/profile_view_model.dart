import 'package:flight_reminder/base/base_view_model.dart';
import 'package:flight_reminder/database/model/entities/user.dart';
import 'package:flight_reminder/database/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';


class ProfileViewModel extends BaseViewModel {
  final UserRepository _userRepository;

  ProfileViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;

  // Future<User?> getUserProfile(int userId) async {
  //   viewIsLoading(true);

  //   try {
  //     User? userProfile = await _userRepository.getUserById(userId);

  //     viewIsLoading(false);

  //     return userProfile;
  //   } catch (e) {
  //     viewIsLoading(false);
  //     return null; // Handle the error appropriately in your UI
  //   }
  // }

  // Future<bool> updateProfile(
  //     String userId, String firstName, String lastName, String email) async {
  //   viewIsLoading(true);

  //   try {
  //     // Fetch the user profile first
  //     User? userProfile = await _userRepository.getUserById(userId);

  //     if (userProfile != null) {
  //       // Update the user's data
  //       userProfile.firstName = firstName;
  //       userProfile.lastName = lastName;
  //       userProfile.email = email;

  //       // Save the updated user profile
  //       bool success = await _userRepository.updateUser(userProfile);

  //       viewIsLoading(false);

  //       return success;
  //     } else {
  //       viewIsLoading(false);
  //       return false; // User profile not found
  //     }
  //   } catch (e) {
  //     viewIsLoading(false);
  //     return false; // Handle the error appropriately in your UI
  //   }
  // }
}
