import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Models/driver_model.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';
import 'package:fyp_driver/forget_page.dart';
import 'package:fyp_driver/login_page.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPWScreen extends StatefulWidget {
  bool reset;
  String id;
  @override
  State<ResetPWScreen> createState() => _ResetPWScreenState();

  ResetPWScreen(this.reset, this.id);
}

class _ResetPWScreenState extends State<ResetPWScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pwController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 30, 39, 1),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        color: Colors.green,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Let's reset password.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Satisfy',
                        fontSize: 40),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Enter new password.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "You have been missed!",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: pwController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      fillColor: Color.fromRGBO(58, 57, 62, 0.4),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }

                      if (pwController.text != confirmController.text) {
                        return 'Password does not match';
                      }
                    },
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        "Confirm Password",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      fillColor: Color.fromRGBO(58, 57, 62, 0.4),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: const Center(
                      child: Text(
                        "INTELLIGENT DELIVERY MANAGEMENT SYSTEM",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 214, 77, 1),
                            letterSpacing: 1.2,
                            wordSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        login();

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (builder) => HomeScreen()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Center(
                          child: Text(
                            'Reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(31, 30, 39, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        var resp = await Dio().put(
          "https://idms.backend.eastdevs.com/api/drivers/${widget.id}",
          data: {
            "data": {"password": confirmController.text}
          },
        );
        print(resp.data);

        if (resp.statusCode == 200) {
          Fluttertoast.showToast(msg: "Password reset successful");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (builder) => LoginPage()));
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
