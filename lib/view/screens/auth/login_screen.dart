import 'package:flutter/material.dart';
import 'package:vibezplay/view/widgets/glitch_effect.dart';
import 'package:vibezplay/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
                child: const Text(
              'VibezPlay',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInput(
                  myController: _emailController,
                  myIcon: Icons.email,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade500),
                  ),
                  child: const Text('Login',),
                )),
          ],
        ),
      ),
    );
  }
}
