import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Models/driver_model.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';
import 'package:fyp_driver/forget_page.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static DriverModel driver = DriverModel(
      "id",
      "Name",
      "Email",
      "password",
      "PhoneNo",
      "Age",
      "Male",
      "Nic",
      "Address",
      "createdAt",
      "updatedAt",
      "publishedAt",
      "availableOrUnavailableStatus",
      "liscenceNo",
      "q1",
      "q2",
      "q3",
      "a1",
      "a2",
      "a3");

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 30, 39, 1),
      body: ListView(
        children: [
          ModalProgressHUD(
            inAsyncCall: isLoading,
            color: Colors.green,
            child: Container(
              height: MediaQuery.of(context).size.height * (0.95),
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
                        "Let's sign you in .",
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
                        "You have been missed!",
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
                      TextFormField(
                        controller: passController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                        },
                        obscureText: true,
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
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => ForgetPage()));
                        },
                        child: Container(
                          child: const Center(
                            child: Text(
                              "Forget password ?",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                  wordSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: const Text(
                                'Sign In',
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
        ],
      ),
    );
  }

  login() async {
    setState(() {
      isLoading = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var resp = await Dio().get(
          "https://idms.backend.eastdevs.com/api/drivers?filters[email][\$eq]=${emailController.text}&filters[password][\$eq]=${passController.text}");
      if (resp.statusCode == 200) {
        if (resp.data["meta"]["pagination"]["total"] != 0) {
          print(resp.data["data"][0]);
          LoginPage.driver = DriverModel.fromMap(
              resp.data["data"][0]["id"].toString(),
              resp.data["data"][0]["attributes"]);
          print(LoginPage.driver.Email);
          prefs.setString("email", emailController.text);
          prefs.setString("driverID", LoginPage.driver.id);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => Welcome(),
            ),
          );
        } else {
          Fluttertoast.showToast(msg: "Please check username and password");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }
}

const Color signInButton = Color(0xFF024335);
const Color hintText = Color(0xFFB4B4B4);
