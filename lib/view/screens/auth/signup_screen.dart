import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/components/validators.dart';
import 'package:vibezplay/constants.dart';
import 'package:vibezplay/controller/auth_controller.dart';
import 'package:vibezplay/view/screens/auth/login_screen.dart';
import '../../widgets/glitch_effect.dart';
import '../../widgets/text_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _setPassController = TextEditingController();

  final TextEditingController _confirmPassController = TextEditingController();

  final TextEditingController _setUsernameController = TextEditingController();

  void setStateFunction() {
    setState(() {});
  }

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
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.pickImage(setStateFunction);
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          backgroundImage: AuthController.instance.proImg !=
                                  null
                              ? FileImage(AuthController.instance.proImg!)
                              : const NetworkImage(
                                      'https://i.pinimg.com/736x/83/bc/8b/83bc8b88cf6bc4b4e04d153a418cde62.jpg')
                                  as ImageProvider,
                          radius: Get.height * 0.08,
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
                                  size: Get.height * 0.03,
                                  color: Colors.grey.shade400,
                                )))
                      ],
                    ),
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
                    height: Get.height * 0.025,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      myController: _setPassController,
                      validate: (value) => validatePassword(value!),
                      myIcon: Icons.password,
                      mylableText: "Set Password",
                      obsercureTxtValue: true,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      myController: _confirmPassController,
                      validate: (value) {
                        if (value != _setPassController.text) {
                          return 'password dosen\'t match';
                        } else {
                          return null;
                        }
                      },
                      myIcon: Icons.lock,
                      mylableText: "Confirm Password",
                      obsercureTxtValue: true,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      myController: _setUsernameController,
                      validate: (value) {
                        if (value!.contains(' ')) {
                          return 'username can\'t contain spaces';
                        } else {
                          return null;
                        }
                      },
                      myIcon: Icons.person_2_rounded,
                      mylableText: "Set Username",
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    height: 73, // Get.height * 0.08,
                    width: 260, //Get.width * 0.6,
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
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => LoginScreen());
                        },
                        child: Text(
                          " SignIn",
                          style: TextStyle(
                              fontSize: 19, color: Colors.grey.shade500),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
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
