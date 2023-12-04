import 'package:flutter/material.dart';
import 'package:elixr_poc/screens/sign_up_page.dart';
import 'package:elixr_poc/widgets/custom_elevated_button.dart';
import 'package:elixr_poc/widgets/custom_text.dart';
import 'package:elixr_poc/widgets/custom_textformfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: sHeight,
          width: sWidth,
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.all(25),
                        child: CustomText(
                          text: 'Sign in to your account',
                          fontSize: 25,
                        )),
                  ),
                  SizedBox(
                    height: sHeight * 0.04,
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
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: sHeight * 0.04,
                  ),
                  CustomElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16),
                      )),
                  SizedBox(
                    height: sHeight * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
