import 'package:flutter/material.dart';

import '../../common_widgets/custom_textformfeild/custom_pass_textformfeild.dart';
import '../../common_widgets/custom_textformfeild/custom_textformfeild.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../constants/app_style/app_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///<<<===Controller Email======>>>>>
  final TextEditingController _emailController = TextEditingController();

  ///<<<===Controller First Name======>>>>>
  final TextEditingController _firstNameController = TextEditingController();

  ///<<<===Controller Password======>>>>>
  final TextEditingController _passwordController = TextEditingController();

  ///<<<===Controller Confirm Password======>>>>>
  final TextEditingController _confirmPasswordController = TextEditingController();

  ///<<<<<=======Form Key====>>>>>>.
  final GlobalKey<FormState> _SignUpFormKey = GlobalKey<FormState>();

  ///<<<<<=======Validate Form============>>>>>v
  _validForm() {
    if (_SignUpFormKey.currentState!.validate()) {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ))
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

  ///<<<<<<<<<<<========= COnfirmPassword Validator==========>>>>>>>>>>>
  RegExp passValid1 = RegExp(r"^(?=.*\d)[A-Za-z0-9_]+$");

  bool validatePassword1(String msg1) {
    String password1 = msg1.trim();

    if (passValid1.hasMatch(password1)) {
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
          children: [
            Column(
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
                          text: 'Already have an Account ?',
                          style: TextStyle(
                              fontFamily: 'Poppins Regular',
                              color: text1Color,
                              fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign In',
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
                        'SIGN UP',
                        style: headingStyle1,
                      ),
                      Text(
                        'Create your account',
                        style: headingStyle2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      ///<<<===FIrst Name====>>>
                      Form(
                        key: _SignUpFormKey,
                        child: Column(
                          children: [
                            CustomTextFormFeild(
                              formController: _firstNameController,
                              hintText: 'First Name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: fieldTextColor,
                              ),
                              onValidate: (firstName) {
                                if (firstName!.isEmpty) {
                                  return 'Please enter First Name';
                                } else if (firstName.length < 3) {
                                  return 'First Name should contain atleast 3 characters';
                                } else if (firstName.length > 20) {
                                  return 'First Name should less than 20 characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormFeild(
                              hintText: 'Last Name(Optional)',
                              prefixIcon: Icon(
                                Icons.person,
                                color: fieldTextColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ///Email
                            CustomTextFormFeild(
                              formController: _emailController,
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
                              formController: _passwordController,
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: fieldTextColor,
                              ),
                              onValidate: (pass1) {
                                if (pass1!.isEmpty) {
                                  return 'Please enter password without Special Character';
                                } else if (pass1.length < 6) {
                                  return 'Password atleast contain atleast 6 Characters';
                                } else if (pass1.length > 15) {
                                  return 'Password should atleast 15 Characters';
                                } else {
                                  bool result1 = validatePassword(pass1);
                                  if (result1) {
                                    return null;
                                  } else {
                                    return 'Password should contain atleast One Number';
                                  }
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            ///<<<===Confirm Password====>>>
                            CustomPassTextFormFeild(
                              formController: _confirmPasswordController,
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: fieldTextColor,
                              ),
                              onValidate: (pass1) {
                                if (pass1!.isEmpty) {
                                  return 'Please enter confirm password without Special Character';
                                } else if (pass1.length < 6) {
                                  return 'Confirm Password atleast contain atleast 6 Characters';
                                } else if (pass1.length > 15) {
                                  return 'Confirm Password should atleast 15 Characters';
                                } else if (_confirmPasswordController.text !=
                                    _passwordController.text) {
                                  return 'Confirm Password doesnot Match';
                                } else {
                                  bool result1 = validatePassword(pass1);
                                  if (result1) {
                                    return null;
                                  } else {
                                    return 'Confirm Password should contain atleast One Number';
                                  }
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Divider(
                        thickness: 2,
                        color: dividerColor,
                      ),
                      const SizedBox(
                        height: 20,
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
                            width: 130,
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
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
