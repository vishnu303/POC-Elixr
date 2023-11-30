import 'package:elixr_poc/screens/sign_in_page.dart';
import 'package:flutter/material.dart';

import 'package:elixr_poc/widgets/custom_elevated_button.dart';
import 'package:elixr_poc/widgets/custom_text.dart';
import 'package:elixr_poc/widgets/custom_textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _empIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: sHeight,
          width: sWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(20),
                        child: CustomText(
                          text: 'Create an Account',
                          fontSize: 25,
                        )),
                    SizedBox(
                      height: sHeight * 0.04,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'field can\'t be empty';
                              }
                              return null;
                            },
                            controller: _firstNameController,
                            labelText: 'First name',
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'field can\'t be empty';
                              }
                              return null;
                            },
                            controller: _lastNameController,
                            labelText: 'Last name',
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field can\'t be empty';
                        }
                        return null;
                      },
                      controller: _empIdController,
                      labelText: 'EMP ID',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                                .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: _emailController,
                      labelText: 'Email',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the password';
                        } else if (value.length < 8) {
                          return "Password must be atleast 8 characters long";
                        }
                        return null;
                      },
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please re-enter the password";
                        } else if (value.length < 8) {
                          return "Password must be atleast 8 characters long";
                        } else if (value != _passwordController.text) {
                          return "Password must be same as above";
                        } else {
                          return null;
                        }
                      },
                      controller: _confirmPasswordController,
                      labelText: 'Confirm password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sHeight * 0.04,
              ),
              CustomElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(
                height: sHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text: "Do you have an account ? ", fontSize: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                    },
                    child: const CustomText(
                      text: 'Sign In',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
