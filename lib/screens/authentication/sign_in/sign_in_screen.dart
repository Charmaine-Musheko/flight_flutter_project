
import 'package:flight_reminder/database/repositories/results/login_result.dart';
import 'package:flight_reminder/locator.dart';
import 'package:flight_reminder/navigation/initial_arguments.dart';
import 'package:flight_reminder/screens/authentication/sign_in/sign_in_viewmodel.dart';
import 'package:flight_reminder/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:flight_reminder/screens/flights/flight_screen.dart';
import 'package:flight_reminder/utils/toast_helper.dart';
import 'package:flight_reminder/widgets/stateful/loading_view.dart';
import 'package:flight_reminder/widgets/stateless/custom_flat_button.dart';
import 'package:flight_reminder/widgets/stateless/custom_large_button.dart';
import 'package:flight_reminder/widgets/stateless/custom_text_form_field.dart';
import 'package:flight_reminder/widgets/stateless/custom_text_form_password_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget{
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = "signInScreen";
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInViewModel viewModel = locator<SignInViewModel>();

 @override
  void initState() {
    _emailController.text = "mushekot@gmail.com";
    _passwordController.text = "Testing@123";
    super.initState();
  }
  
    @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SignInViewModel>(
        builder: (context, value, child) => Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/orange_plane.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container( // Wrap the Column in a Container with a fixed height
                      height: MediaQuery.of(context).size.height, // Adjust the height as needed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   'assets/smaller_logo.png',
                          //   width: MediaQuery.of(context).size.width * 0.6,
                          //   height: MediaQuery.of(context).size.height * 0.3,
                          // ),
                          SizedBox(height: 150),
                          CustomTextField(
                            isReadonly: false,
                            hint: 'Email',
                            type: TextInputType.emailAddress,
                            obscureText: false,
                            controller: _emailController,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldPassword(
                            isReadonly: false,
                            type: TextInputType.visiblePassword,
                            controller: _passwordController,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'or Sign in with',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          CustomLargeButton(
                            text: 'Sign In',
                            onClick: () async {
                              LoginResult result = await viewModel.login(
                                  _emailController.text,
                                  _passwordController.text);
                              _login(result);
                            },
                            hasShadow: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFlatButton(
                            text: 'Dont have an account? Sign Up',
                            onClick: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                          ),
                         // Image.asset('assets/green_logo.png'),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                 LoadingView(
                            show: viewModel.isLoading,
                          )],
              ),
            ),
          ),
        ),
      ),
    );
  }


  

  void _login(LoginResult result) async {
    if (result.status == LoginStatus.success) {
      Map<String, dynamic> userInfo = result.result;
      int id = userInfo["user_id"] ?? '';
      String firstName = userInfo["first_name"] ?? '';
      String lastName = userInfo["last_name"] ?? '';
      String email = userInfo["email"] ?? '';
      String address = userInfo["address"] ?? '';
      String password = userInfo["password"] ?? '';

      //bool isEmailConfirmed = userInfo["IsEmailConfirmed"] ?? false;
      var value = await viewModel.insertUser(
          id, firstName, lastName,  email, address, password);
      if (value != 0) {
        viewModel.setDidLogin();
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, FlightScreen.routeName, (route) => false,
              arguments: InitialArguments(index: 0));
        }
      } else {
        ToastHelper.showLongToast('Unknown error');
      }
    } else {
      ToastHelper.showLongToast(result.getMessage());
    }
  }
}

  // Function to check if the device is an Apple device
  bool get isAppleDevice {
    // Implement your device type detection logic
    return false; // Replace with your actual logic
  }
