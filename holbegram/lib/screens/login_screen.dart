import 'package:flutter/material.dart';
import 'package:holbegram/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool _passwordVisible = true;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 28),
        Text(
          'Holbegram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 50,
          ),
        ),
        Image(
          width: 80,
          height: 60,
          image: AssetImage('assets/images/logo.webp'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(height: 28),
            TextFieldInput(
              controller: widget.emailController,
              isPassword: false,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 24,
            ),
            TextFieldInput(
              controller: widget.passwordController,
              isPassword: !_passwordVisible,
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),

            SizedBox(height: 28,),

            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Color.fromARGB(218, 226, 37, 24)
                  )
                ),
                onPressed: () {},
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                ),
            ),

           SizedBox(height: 24,),

           

          ]),
        )
      ],
    )));
  }
}
