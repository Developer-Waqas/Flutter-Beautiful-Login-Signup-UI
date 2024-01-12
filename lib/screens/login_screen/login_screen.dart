import 'package:flutter/material.dart';

import '../../common_widgets/custom_textformfeild/custom_pass_textformfeild.dart';
import '../../common_widgets/custom_textformfeild/custom_textformfeild.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_style/app_style.dart';
import '../signup_screen/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ///<<<===Controller Email======>>>>>
  final TextEditingController _loginEmailController = TextEditingController();

  ///<<<<<=======Form Key====>>>>>>.
  final GlobalKey<FormState> _SignInFormKey = GlobalKey<FormState>();

  ///<<<<<=======Validate Form============>>>>>v
  _validForm() {
    if (_SignInFormKey.currentState!.validate()) {
   // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ))
    }
  }

  ///<<<<<<<============Email Validator============>>>>>>>>>>>>>
  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter Email';
    }
    RegExp emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter valid Email';
    }
    return null;
  }

  ///<<<<<<<<<<<=========Password Validator==========>>>>>>>>>>>
  RegExp passValid = RegExp(r"^(?=.*\d)[A-Za-z0-9_]+$");
  bool validatePassword(String msg) {
    String password = msg.trim();

    if (passValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/bg_image.png',
            ),
          ),
        ),
        child: ListView(
          children: [Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an Account ?',
                        style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            color: text1Color,
                            fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            color: whiteColor,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SIGN IN',
                      style: headingStyle1,
                    ),
                    Text(
                      'Sign in with email address',
                      style: headingStyle2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    ///<<<===Email====>>>
                    Form(
                      key: _SignInFormKey,
                      child: Column(
                        children: [
                          CustomTextFormFeild(
                            formController: _loginEmailController,
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: fieldTextColor,
                            ),
                            onValidate: _validateEmail,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          ///<<<===Password====>>>
                          CustomPassTextFormFeild(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: fieldTextColor,
                            ),
                            onValidate: (pass){
                              if(pass!.isEmpty){
                                return 'Please enter password without Special Character';
                              }
                              else if(pass.length < 6){
                                return 'Password atleast contain atleast 6 Characters';
                              }
                              else if(pass.length > 15){
                                return 'Password should atleast 15 Characters';
                              }
                              else {
                                bool result = validatePassword(pass);
                                if(result){
                                  return null;
                                }
                                else{
                                  return 'Password should contain atleast One Number';
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password ?',
                            style: headingStyle2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              gradColor1,
                              gradColor2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: _validForm,
                          child: Text(
                            'Sign In',
                            style: headingStyle2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 2,
                      color: dividerColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Or continue with',
                        style: headingStyle5,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 36,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: subButtonColor,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  const Image(
                                      width: 15,
                                      height: 16,
                                      image: AssetImage(
                                        'assets/images/ic_icon_google.png',
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Google',
                                    style: headingStyle5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 36,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: subButtonColor,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Image(
                                    width: 15,
                                    height: 20,
                                    image: AssetImage(
                                        'assets/images/ic_icon_fb.png')),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Facebook',
                                  style: headingStyle5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
        ),
      ),
    );
  }
}
