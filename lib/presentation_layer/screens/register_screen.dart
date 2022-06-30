import 'package:algoriza_task1/constants.dart';
import 'package:algoriza_task1/presentation_layer/reusable_components/default_textfield.dart';
import 'package:algoriza_task1/presentation_layer/screens/login_screen.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../reusable_components/default_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = 'RegisterScreen';
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'Eg';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginScreen.routeName);
        },
        backgroundColor: Colors.black,
        mini: true,

        child: const Icon(Icons.arrow_back_ios_outlined, size: 25),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              height: 150,
              decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Capture_auto_x2.jpg'),
                  fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome to Fashion Daily'),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text('Register',
                            style: GoogleFonts.sourceSerifPro(fontSize: 35)),
                        const Spacer(),
                        const Text(
                          'Help',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Image.asset(
                          'assets/icons8-help-72.png',
                          height: 23,
                          width: 23,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 17),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    DefaultTextField(
                        hintText: 'EG.Example@gmail.com',
                        isHidden: false,
                        validator: (value) {
                          return 'Eg';
                        }),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 17),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.grey.shade200
                      ),
                      child: InternationalPhoneNumberInput(
                        inputDecoration:
                        const InputDecoration(border: InputBorder.none),
                        onInputChanged: (PhoneNumber number) {
                          if (kDebugMode) {
                            print(number.phoneNumber);
                          }
                        },
                        onInputValidated: (bool value) {
                          if (kDebugMode) {
                            print(value);
                          }
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN,
                        ),
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: phoneController,
                        formatInput: false,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        hintText: 'Eg.4552648',
                        onSaved: (PhoneNumber number) {
                          if (kDebugMode) {
                            print('On Saved: $number');
                          }
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 17),
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    DefaultTextField(
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            return null;
                          }
                        },
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                        isHidden: true,
                        onChanged: (String value) {
                          passwordController.text = value;
                        },
                        hintText: 'Password',
                        suffix: Icons.visibility_off,
                        suffixPressed: () {}),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      imgPath: null,
                      onTap: () {},
                      height: 15,
                      buttonText: 'Sing in',
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      borderRadius: 8,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Or')),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onTap: () {},
                      imgPath: 'assets/icons8-google-72.png',
                      width: 25,
                      height: 16,
                      buttonText: 'Sing with by google',
                      buttonColor: Colors.white,
                      textColor: Colors.blue,
                      borderRadius: 8,
                      borderColor: Colors.blue,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          " has any account? ",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        InkWell(
                          child: const Text(
                            'Sign in here',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          textAlign: TextAlign.center,
                          'By registering your account ,you are agree to our',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'terms and conditions.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
