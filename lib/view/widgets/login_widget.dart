import 'package:digital_wallet/view/widgets/register_widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  static String routeName = 'login-widget';
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  var _loding = false;
  String? _loginPassword;

  String? _loginPhoneNumber;

  @override
  Widget build(BuildContext context) {
    void _onSave() {
      final weAreOkay = _formKey.currentState!.validate();
      _formKey.currentState!.save();
      if (weAreOkay) {
        setState(() {
          _loding = true;
        });
        // Provider.of<AuthProvider>(context, listen: false)
        //     .authLogin(_loginPhoneNumber, _loginPassword);
      }
    }

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                Image.asset(
                  'assets/images/logo.png',
                  width: 200.0,
                ),
              ],
            ),
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
                          prefixIcon: Icon(
                            Icons.phone_android,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 20.0,
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
                          // _loginPhoneNumber = value;
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
                        style: const TextStyle(
                          fontSize: 20.0,
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
                          // _loginPassword = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'don\'t have an account yet!!',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context)
                                    .pushNamed(RegisterWidget.routeName);
                              });
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                fixedSize: Size(screenSize.width, 50.0),
                backgroundColor: const Color.fromARGB(255, 0, 212, 112),
              ),
              onPressed: () {},
              // onPressed: _onSave,
              child: _loding
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
