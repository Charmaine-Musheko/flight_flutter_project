

import 'package:flight_reminder/database/repositories/results/registration_result.dart';
import 'package:flight_reminder/database/repositories/results/verify_phone_result.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/navigation/initial_arguments.dart';
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:flight_reminder/screens/authentication/sign_up/sign_up_view_model.dart';
import 'package:flight_reminder/screens/flights/flight_screen.dart';
import 'package:flight_reminder/utils/toast_helper.dart';
import 'package:flight_reminder/widgets/stateful/loading_view.dart';
import 'package:flight_reminder/widgets/stateless/custom_flat_button.dart';
import 'package:flight_reminder/widgets/stateless/custom_large_button.dart';
import 'package:flight_reminder/widgets/stateless/custom_text_form_field.dart';
import 'package:flight_reminder/widgets/stateless/custom_text_form_password_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String routeName = "signUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
 

  SignUpViewModel viewModel = locator<SignUpViewModel>();

 @override
  void initState() {
    _emailController.text = "chamainemush@gmail.com";
    _passwordController.text = "Testing@123";
    _firstNameController.text = "Fibiolla";
    _lastNameController.text = "Plaath";
    _phoneNumberController.text = "0811416370";
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SignUpViewModel>(
        builder: (context, value, child) => Scaffold(
          body: Container( // Wrap the Column with a ListView
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/giraffe_background.png'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            //  Image.asset('assets/smaller_logo.png'),
                              SizedBox(height: 20),
                              CustomTextField(
                                isReadonly: false,
                                hint: "Email Address",
                                type: TextInputType.emailAddress,
                                obscureText: false,
                                controller: _emailController,
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                isReadonly: false,
                                hint: "First Name",
                                type: TextInputType.name,
                                obscureText: false,
                                controller: _firstNameController,
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                isReadonly: false,
                                hint: "Last Name",
                                type: TextInputType.name,
                                obscureText: false,
                                controller: _lastNameController,
                              ),
                             CustomTextField(
                                isReadonly: false,
                                hint: "Address",
                                type: TextInputType.name,
                                obscureText: false,
                                controller: _addressController,
                              ),
                           
                              SizedBox(height: 10),
                              CustomTextFieldPassword(
                                isReadonly: false,
                                type: TextInputType.visiblePassword,
                                controller: _passwordController,
                              ),
                              SizedBox(height: 20),
                             CustomFlatButton(
                            text: 'Already have an account? Sign In',
                            onClick: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                          ),
                              SizedBox(height: 10),
                              Text(
                                'or Sign up with',
                                style: TextStyle(fontSize: 16),
                              ),
                            SizedBox(height: 30),
                              CustomLargeButton(
                                text: 'Sign Up',
                                onClick: () async {
                                  RegistrationResult result =
                                      await viewModel.register(
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _emailController.text,
                                          _addressController.text,
                                          _passwordController.text
                                          );
                                  _register(result);
                                },
                                hasShadow: false,
                              ),
                              SizedBox(height: 10),
                           //   Image.asset('assets/green_logo.png'),
                            ],
                          ),
                    ),
                  ),
                      if (viewModel.isLoading)
                        LoadingView(
                          show: viewModel.isLoading,
                        ),
                    ],
              ),
            
              ),
            ),
          ),
        
    );
  }


 void _register(RegistrationResult result) async {
    if (result.status == RegistrationStatus.success) {
       if (result.status == VerifyPhoneStatus.success) {
      int id = result.result?["id"] ?? '';
      String firstName = result.result?["first_name"] ?? '';
      String lastName = result.result?["last_name"] ?? '';
      String email = result.result?["email"] ?? '';
      String address = result.result?["address"] ?? '';
      String password = result.result?["password"] ?? '';
      
      if (id == 0) {
        ToastHelper.showLongToast('Unknown error occurred. Please Login');
        Navigator.popUntil(
            context, ModalRoute.withName(SignInScreen.routeName));
      } else {
        await viewModel.insertUser(
            id, firstName, lastName, address, email, password);
        viewModel.setDidLogin();
          if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, FlightScreen.routeName, (route) => false, arguments: InitialArguments(index: 0));
          }
      }
    } else {
      ToastHelper.showLongToast(result.getMessage());
    }
  }
 }


}