import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/components/validators.dart';
import 'package:vibezplay/controller/auth_controller.dart';
import 'package:vibezplay/view/screens/auth/signup_screen.dart';
import 'package:vibezplay/view/widgets/glitch_effect.dart';
import 'package:vibezplay/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlithEffect(
                    child: const Text(
                      'VibezPlay',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 45),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  const Text(
                    'Login to Account',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                        myController: _emailController,
                        validate: (value) => validateEmail(value),
                        myIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        mylableText: "Email"),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      myController: _passController,
                      validate: (value) => validatePassword(value!),
                      myIcon: Icons.lock,
                      mylableText: "Password",
                      obsercureTxtValue: true,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.045,
                  ),
                  Container(
                      height: 73, //Get.height * 0.08,
                      width: 260, //Get.width * 0.6,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          AuthController.instance.login(
                              _emailController.text, _passController.text);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade500),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const SignupScreen());
                        },
                        child: Text(
                          " SignUp",
                          style: TextStyle(
                              fontSize: 19, color: Colors.grey.shade500),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.035,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
