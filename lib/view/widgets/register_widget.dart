import 'package:digital_wallet/controller/auth_provider.dart';
import 'package:digital_wallet/view/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  static String routeName = 'register-widget';
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  var nationalIDTextFormLocker = false;
  var _loding = false;
  var _idTestLoading = false;
  var _phoneNumberCompersionLoading = false;
  var phoneNumberCompersionLoading = true;
  bool get isValid {
    return false;
  }

  final _registerID = TextEditingController();
  final _registerPhoneNumber = TextEditingController();
  String? _registerPassword;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AuthProvider>(context, listen: true).user;
    // final nationalIDTextFormLocker =
    //     Provider.of<AuthProvider>(context, listen: true).nationalIDAccepted;

    // final fullName = TextEditingController(
    //     text:
    //         '${user.firstName.toUpperCase()} ${user.fatherName.toUpperCase()} ${user.grandFatherName.toUpperCase()} ${user.lastName.toUpperCase()}');
    // final dateOfBirth =
    //     TextEditingController(text: DateFormat.yMd().format(user.dateOfBirth!));

    // final jobTitle = TextEditingController(text: user.jobTitle);
    void onSave() {
      final weAreOkay = _formKey.currentState!.validate();
      _formKey.currentState!.save();
      if (weAreOkay) {
        setState(() {
          _loding = true;
        });
      }
    }

    final screenSize = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenSize.padding.top,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo-modified.png',
                  height: 150.0,
                  color: Colors.grey,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'National Number',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    
                                  });
                                },
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                style: const ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            readOnly: nationalIDTextFormLocker,
                            controller: _registerID,
                            onChanged: (value) {
                              if (value.length == 10) {
                                Provider.of<AuthProvider>(context,
                                    listen: false)
                                    .testID('${_registerID.value.text}');
                                setState(() {
                                  nationalIDTextFormLocker = true;
                                  _idTestLoading = true;
                                });
                              } else if (value.isEmpty) {
                                setState(() {
                                  _idTestLoading = false;
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your National Number';
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                          ),
                          width: 100,
                          child: nationalIDTextFormLocker
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : Center(
                                  child: _idTestLoading
                                      ? const CircularProgressIndicator()
                                      : null,
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone_android),
                            ),
                            // controller: _registerPhoneNumber,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            onChanged: (value) {
                              // print(user.phoneNumber);
                              // print(_registerPhoneNumber.value.text);
                              if (value.isNotEmpty) {
                                setState(() {
                                  // _phoneNumberCompersionLoading = true;
                                });
                              } else if (value.isEmpty) {
                                setState(() {
                                  // _phoneNumberCompersionLoading = false;
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Phone Number';
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 25.0,
                          ),
                          width: 100,
                          // child: _registerPhoneNumber.value.text ==
                          //             Provider.of<AuthProvider>(context,
                          //                     listen: true)
                          //                 .user
                          //                 .phoneNumber
                          //                 .toString() &&
                          //         _phoneNumberCompersionLoading
                          //     ? const Icon(
                          //         Icons.check_circle,
                          //         color: Colors.green,
                          //       )
                          //     : Center(
                          //         child: _phoneNumberCompersionLoading
                          //             ? const CircularProgressIndicator()
                          //             : null,
                          //       ),
                        ),
                      ],
                    ),
                    if (isValid)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1200),
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        // height: _registerPhoneNumber.value.text ==
                        //             Provider.of<AuthProvider>(context,
                        //                     listen: true)
                        //                 .user
                        //                 .phoneNumber
                        //                 .toString() &&
                        //         phoneNumberCompersionLoading
                        //     ? 140
                        //     : 0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                // controller: fullName,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  label: Text('Full Name'),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      readOnly: true,
                                      // controller: dateOfBirth,
                                      decoration: const InputDecoration(
                                        label: Text('Date Of Birth'),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: TextFormField(
                                      readOnly: true,
                                      // controller: jobTitle,
                                      decoration: const InputDecoration(
                                        label: Text('Job Title'),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                      obscureText: true,
                      maxLength: 30,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // _registerPassword = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                      ),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fixedSize: Size(screenSize.size.width * 0.75, 50.0),
                    backgroundColor: const Color.fromARGB(255, 0, 212, 112),
                  ),
                  onPressed: onSave,
                  child: _loding
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
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
                    fixedSize: Size(screenSize.size.width * 0.25, 50.0),
                    backgroundColor: const Color.fromARGB(255, 10, 75, 149),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginWidget.routeName);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
