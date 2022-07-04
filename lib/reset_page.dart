import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Screens/change_pw.dart';
import 'package:fyp_driver/forget_page.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class ResetPage extends StatefulWidget {
  String q1;
  String q2;
  String q3;
  String a1;
  String a2;
  String a3;
  String id;

  ResetPage(this.id, this.q1, this.q2, this.q3, this.a1, this.a2, this.a3);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController q1Controller = TextEditingController();
  TextEditingController q2Controller = TextEditingController();
  TextEditingController q3Controller = TextEditingController();

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
                    "Let's reset password .",
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
                    "Don't worry! It won't take long.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Enter answers..",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        widget.q1,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            wordSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: q1Controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      if (!EmailValidator.validate(value)) {
                        return "Enter valid Email";
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        "Answer",
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
                    height: 30,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        widget.q2,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            wordSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: q2Controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      if (!EmailValidator.validate(value)) {
                        return "Enter valid Email";
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        "Answer",
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
                    height: 30,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        widget.q3,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            wordSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: q3Controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      if (!EmailValidator.validate(value)) {
                        return "Enter valid Email";
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(
                        "Answer",
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
                        if (widget.a1 == q1Controller.text &&
                            widget.a2 == q2Controller.text &&
                            widget.a3 == q3Controller.text) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) =>
                                  ResetPWScreen(true, widget.id)));
                        } else {
                          Fluttertoast.showToast(msg: "Answers does not match");
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: const Text(
                            'Next',
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
}

const Color signInButton = Color(0xFF024335);
const Color hintText = Color(0xFFB4B4B4);
