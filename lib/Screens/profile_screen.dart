import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Models/driver_model.dart';
import 'package:fyp_driver/Screens/change_pw.dart';
import 'package:fyp_driver/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
  static String profilePic = "";
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DriverModel driver;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    writeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(255, 214, 77, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10))
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    EditProfilePage.profilePic,
                                  ),
                                ),
                              ),
                            ),
                            /* Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color:
                                        const Color.fromRGBO(255, 214, 77, 1),
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                )),*/
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      buildTextField("Name", false, nameController),
                      buildTextField("E-mail", false, emailController),
                      buildTextField("Phone num", false, passController),
                      buildTextField("Address", false, addressController),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              // padding:
                              //     const EdgeInsets.symmetric(horizontal: 50),
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (builder) => ResetPWScreen(
                                            false, LoginPage.driver.id)));
                              },
                              child: const Text("Change Password",
                                  style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 1,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
                                update();
                              },
                              color: const Color.fromRGBO(255, 214, 77, 1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, bool isPasswordTextField,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        controller: controller,
        enabled: false,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  getEmailandData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    try {
      var resp = await Dio().get(
          "https://idms.backend.eastdevs.com/api/drivers?filters[email][\$eq]=${emailController.text}&filters[password][\$eq]=${passController.text}");
      if (resp.statusCode == 200) {
        if (resp.data["meta"]["pagination"]["total"] != 0) {
          print(resp.data["data"][0]);
          LoginPage.driver = DriverModel.fromMap(
              resp.data["data"][0]["id"].toString(),
              resp.data["data"][0]["attributes"]);
          prefs.setString("email", emailController.text);
        } else {
          Fluttertoast.showToast(msg: "Error in fetching data");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  update() async {
    setState(() {
      isLoading = true;
    });
    String name = nameController.text;
    String address = addressController.text;
    String email = emailController.text;
    String id = driver.id.toString();
    try {
      var response = await Dio()
          .put("https://idms.backend.eastdevs.com/api/Drivers/$id", data: {
        "data": {
          "Name": name,
          "Address": address,
          "email": email,
        }
      });
      print("Update $response");
      Fluttertoast.showToast(msg: "Updated Profile");
      getEmailandData();
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void writeData() {
    nameController.text = LoginPage.driver.Name;
    emailController.text = LoginPage.driver.Email;
    passController.text = LoginPage.driver.liscenceNo;
    addressController.text = LoginPage.driver.Address;
  }
}