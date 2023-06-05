import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //this is only to hide the image background
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              top: 60.0,
              child: Image.asset(
                'assets/images/logo.png',
                width: 200.0,
              ),
            ),
            Positioned(
              left: 20.0,
              top: 90.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Color.fromARGB(255, 10, 75, 149),
                    ),
                  ),
                  Text(
                    'Quick financial \n solutions',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Color.fromARGB(255, 0, 212, 112),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'don\'t have an account yet!!',
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Register',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      height: 60.0,
                      color: Colors.black12,
                      child: const Text(
                        'Hint: \n use admin 1234',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  )),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fixedSize: Size(screenSize.width, 50.0),
                  backgroundColor: const Color.fromARGB(255, 0, 212, 112),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Call login API here with _email and _password variables
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
