import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/myroute.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Enter Username",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, MyRoute.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade700,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                        ),
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ))
                ],
              ),
            ),
          ],
        )));
  }
}
