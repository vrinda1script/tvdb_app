import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/login_controller_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailTextField(),
            SizedBox(height: 20.0),
            PasswordTextField(),
            SizedBox(height: 20.0),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return TextField(
      controller: controller.emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return TextField(
      controller: controller.passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return ElevatedButton(
      onPressed: () {
        print('Email: ${controller.emailController.text}');
        print('Password: ${controller.passwordController.text}');
      },
      child: Text('Login'),
    );
  }
}
