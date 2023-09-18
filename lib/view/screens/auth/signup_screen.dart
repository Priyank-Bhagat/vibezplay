import 'package:flutter/material.dart';
import 'package:vibezplay/constants.dart';
import 'package:vibezplay/controller/auth_controller.dart';

import '../../widgets/glitch_effect.dart';
import '../../widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _setPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _setUsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: GlithEffect(
          child: const Text(
            'VibezPlay',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    AuthController.instance.pickImage();
                  },
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/736x/83/bc/8b/83bc8b88cf6bc4b4e04d153a418cde62.jpg'),
                        radius: 55,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black38),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.grey.shade400,
                              )))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                    myController: _setPassController,
                    myIcon: Icons.password,
                    mylableText: "Set Password",
                    obsercureTxtValue: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    myController: _confirmPassController,
                    myIcon: Icons.lock,
                    mylableText: "Confirm Password",
                    obsercureTxtValue: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    myController: _setUsernameController,
                    myIcon: Icons.person_2_rounded,
                    mylableText: "Set Username",
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
                        AuthController.instance.signUp(
                            _setUsernameController.text,
                            _emailController.text,
                            _confirmPassController.text,
                            AuthController.instance.proImg);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade500),
                      ),
                      child: const Text(
                        'Sign Up',
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
