import 'package:digital_wallet/controller/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _login = true;
  var _loding = false;
  String? _phoneNumber;
  String? _password;

  void _onSave() {
    final weAreOkay = _formKey.currentState!.validate();
    _formKey.currentState!.save();
    if (weAreOkay) {
      setState(() {
        _loding = true;
      });
      if (_login) {
        Provider.of<AuthProvider>(context, listen: false)
            .authLogin(_phoneNumber, _password);
      } else {}
    }
  }

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
            if (_login)
              Positioned(
                right: 0.0,
                top: 50.0,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200.0,
                ),
              ),
            if (!_login)
              Positioned(
                right: screenSize.width * 0.25,
                top: 0.0,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200.0,
                ),
              ),
            if (_login)
              Positioned(
                left: 20.0,
                top: 80.0,
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
            if (_login)
              Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 16.0,
                  bottom: 16.0,
                  right: 16.0,
                ),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 9,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _phoneNumber = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                          maxLength: 30,
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
                              onPressed: () {
                                setState(() {
                                  _login = !_login;
                                });
                              },
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
                            'Hint: \n use 711722733 with 1234',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            if (!_login)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'National Number',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your National Number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _phoneNumber = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 7,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                          maxLength: 30,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _phoneNumber = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 0.0,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: _login
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                )),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: _login
                          ? Size(screenSize.width, 50.0)
                          : Size(screenSize.width * 0.75, 50.0),
                      backgroundColor: const Color.fromARGB(255, 0, 212, 112),
                    ),
                    onPressed: _onSave,
                    child: _loding
                        ? const CircularProgressIndicator()
                        : _login
                            ? const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              )
                            : const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                        )),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fixedSize: Size(screenSize.width * 0.25, 50.0),
                        backgroundColor: const Color.fromARGB(255, 10, 75, 149),
                      ),
                      onPressed: () {
                        setState(() {
                          _login = !_login;
                        });
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
