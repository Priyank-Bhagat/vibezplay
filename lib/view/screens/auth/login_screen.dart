import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/controller/auth_controller.dart';
import 'package:vibezplay/view/screens/auth/signup_screen.dart';
import 'package:vibezplay/view/widgets/glitch_effect.dart';
import 'package:vibezplay/view/widgets/text_input.dart';

import '../../../constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlithEffect(
                  child: const Text(
                    'VibezPlay',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Login to Account',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                      myController: _emailController,
                      myIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      mylableText: "Email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    myController: _passController,
                    myIcon: Icons.lock,
                    mylableText: "Password",
                    obsercureTxtValue: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        AuthController.instance
                            .login(_emailController.text, _passController.text);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade500),
                      ),
                      child: const Text(
                        'Login',
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.offAll(() => SignupScreen());
                        },
                        child: Text(
                          " SignUp",
                          style: TextStyle(fontSize: 17,color: Colors.grey.shade500),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
