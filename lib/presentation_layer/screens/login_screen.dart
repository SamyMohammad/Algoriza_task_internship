import 'package:algoriza_task1/constants.dart';
import 'package:algoriza_task1/presentation_layer/reusable_components/default_button.dart';
import 'package:algoriza_task1/presentation_layer/reusable_components/default_textfield.dart';
import 'package:algoriza_task1/presentation_layer/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login screen';

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();

    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/695.jpg'),
      context,
    );
  }

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
            top: 80,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome to Fashion Daily'),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text('Sign in',
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
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    imgPath: null,
                    onTap: () {},
                    buttonText: 'Sing in',
                    buttonColor: Colors.blue,
                    textColor: Colors.white,
                    borderRadius: 8,
                  ),
                  const SizedBox(
                    height: 25,
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
                  const SizedBox(height: 25),
                  CustomButton(
                    onTap: () {},
                    imgPath: 'assets/icons8-google-72.png',
                    width: 25,
                    height: 25,
                    buttonText: 'Sing with by google',
                    buttonColor: Colors.white,
                    textColor: Colors.blue,
                    borderRadius: 8,
                    borderColor: Colors.blue,
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                        const Text(
                        "Doesn't has any account ",
                          style: TextStyle(color: Colors.black, fontSize: 17),

                        ),
                      InkWell(

                        child:   const Text(
                          'Register here',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                     child: Column(
                       children: const [
                         Text(
textAlign: TextAlign.center,

                            'Use the application according to policy rules. Any ',
                             style: TextStyle(

                             color: Colors.grey,fontSize: 15,
                         ),
                         ),
                         SizedBox(height:8,),
                         Text(
                           textAlign: TextAlign.center,

                           'kind of violations will be subject to sections.',
                           style: TextStyle(

                             color: Colors.grey,fontSize: 15,
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
//
// Container(
// height: MediaQuery.of(context).size.height,
// decoration: const BoxDecoration(
// color: Colors.white),
// child: Form(
// key: formKey,
// child: SingleChildScrollView(
// child: Column(
// children: [
// Image.asset('assets/695.jpg'),
// const SizedBox(
// height: 30,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 32),
// child: DefaultTextField(
// controller: emailController,
// validator: (value) {
// if (value!.isEmpty || !value.isValidEmail()) {
// return 'Email is wrong';
// }
// return null;
// },
// isHidden: false,
// onChanged: (value) {
// emailController.text = value;
// },
// hintText: 'Email',
// prefix: Icons.email,
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 32),
// child: DefaultTextField(
// onFieldSubmitted: (value) {
// if (formKey.currentState!.validate()) {}
// },
// controller: passwordController,
// validator: (value) {
// if (value!.isEmpty) {
// return 'Password is too short';
// }
// return null;
// },
// isHidden: true,
// onChanged: (String value) {
// passwordController.text = value;
// },
// hintText: 'Password',
// prefix: Icons.lock,
// suffix: Icons.visibility_off_outlined,
// suffixPressed: () {}),
// ),
// const SizedBox(
// height: 25,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 32),
// child: Container(
// padding: const EdgeInsets.symmetric(horizontal: 32),
// width: 300,
// decoration: BoxDecoration(
// borderRadius:
// const BorderRadius.all(Radius.circular(100)),
// color: Theme.of(context).primaryColor),
// child: TextButton(
// child: const Text(
// "Login",
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w700,
// fontSize: 18),
// ),
// onPressed: () {
// if (formKey.currentState!.validate()) {}
// },
// ),
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Center(
// child: Text(
// "FORGOT PASSWORD ?",
// style: TextStyle(
// color: Theme.of(context).primaryColor,
// fontSize: 12,
// fontWeight: FontWeight.w700),
// ),
// ),
// const SizedBox(
// height: 40,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// const Text(
// "Don't have an Account ? ",
// style: TextStyle(
// color: Colors.black,
// fontSize: 12,
// fontWeight: FontWeight.normal),
// ),
// InkWell(
// onTap: () {},
// child: Text("Sign Up ",
// style: TextStyle(
// color: Theme.of(context).primaryColor,
// fontWeight: FontWeight.w500,
// fontSize: 12,
// decoration: TextDecoration.underline)),
// ),
// ],
// )
// ],
// ),
// ),
// ),
// )
