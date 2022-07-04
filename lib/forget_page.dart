import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Models/driver_model.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';
import 'package:fyp_driver/reset_page.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  //TextEditingController passController = TextEditingController();

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
                    "Let's  reset password .",
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
                    "Welcome back.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Enter your email!",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
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
                        "Email",
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
                        getEmailandData();
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

  getEmailandData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var resp = await Dio().get(
          "http://idms.backend.eastdevs.com/api/drivers?filters[email][\$eq]=${emailController.text}");
      if (resp.statusCode == 200) {
        print(resp.data);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => ResetPage(
                resp.data["data"][0]["id"].toString(),
                resp.data["data"][0]["attributes"]['q1'].toString(),
                resp.data["data"][0]["attributes"]['q2'].toString(),
                resp.data["data"][0]["attributes"]['q3'].toString(),
                resp.data["data"][0]["attributes"]['a1'].toString(),
                resp.data["data"][0]["attributes"]['a2'].toString(),
                resp.data["data"][0]["attributes"]['a3'].toString())));
      } else {
        Fluttertoast.showToast(msg: "Unable to find driver");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to find driver");
    }
    setState(() {
      isLoading = false;
    });
  }
}

const Color signInButton = Color(0xFF024335);
const Color hintText = Color(0xFFB4B4B4);
