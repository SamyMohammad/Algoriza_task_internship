import 'package:algoriza_task1/constants.dart';
import 'package:algoriza_task1/presentation_layer/reusable_components/default_textfield.dart';
import 'package:algoriza_task1/presentation_layer/screens/login_screen.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusable_components/default_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = 'RegisterScreen';
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 280,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Capture_auto_x2.jpg'),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                  top: 90,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Welcome to Fashion Daily'),
                        const SizedBox(
                          height: 10,
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

                        const SizedBox(height: 7),
                        const Text('Email',style: TextStyle(fontSize: 15),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: DefaultTextField( hintText: 'EG.Example@gmail.com',isHidden: false, validator: (value){
                            return 'Eg';
                          }),
                        ),
                        const SizedBox(height: 10),
                        const Text('Phone',style: TextStyle(fontSize: 15),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: DefaultTextField( hintText: 'EG.Example@gmail.com',isHidden: false, validator: (value){
                            return 'Eg';
                          }),
                        ),
                        const SizedBox(height: 10),
                        const Text('Password',style: TextStyle(fontSize: 15),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: DefaultTextField(
                              onFieldSubmitted: (value){ if (formKey.currentState!.validate()) {
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
                              suffixPressed:(){

                              }
                          ),
                        ),


                        const SizedBox(
                          height: 10,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        const SizedBox(height: 10),

                        // DefaultTextField(hintText: 'Eg.Example@gmail.com',isHidden: false, validator: (value){
                        //   return null;
                        // }),



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
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text(
                              " has any account? ",
                              style: TextStyle(color: Colors.black, fontSize: 13),

                            ),
                            InkWell(

                              child:   const Text(
                                'Sign in here',
                                style: TextStyle(color: Colors.blue, fontSize: 13),
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, LoginScreen.routeName);
                              },
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 60),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(

                                'By registering your account ,you are agree to our',
                                style: TextStyle(

                                  color: Colors.grey,fontSize: 8,
                                ),
                              ),
                              SizedBox(height:2,),
                              Text(

                                'terms and conditions.',
                                style: TextStyle(

                                  color: Colors.blue,fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );


  }
}
