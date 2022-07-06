import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:fyp_driver/Screens/app_bar.dart';
import 'package:fyp_driver/Screens/home.dart';
import 'package:fyp_driver/Screens/summary_page.dart';
import 'package:flutter/material.dart';

class RecpientDetailsPage extends StatefulWidget {
  ParcelModel parcelModel;

  RecpientDetailsPage(this.parcelModel);

  @override
  _RecpientDetailsPageState createState() => _RecpientDetailsPageState();
}

class _RecpientDetailsPageState extends State<RecpientDetailsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MyAppBar("Deliver", true),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  'Details of person receiving parcel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                      ]),
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Recipient info",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Name",
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade500, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 214, 77, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: mailController,
                            decoration: InputDecoration(
                              hintText: "example@mail.com",
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade500, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 214, 77, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Phone Number",
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: numController,
                            decoration: InputDecoration(
                              hintText: "xxxx-xxxxxxx",
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade500, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 214, 77, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "CNIC",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: idController,
                            decoration: InputDecoration(
                              hintText: "xxxxx-xxxxxxx-x",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade500, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 214, 77, 1),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>HomeScreen());
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.red,
                          ),
                          child: const Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Fail",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
                      child: GestureDetector(
                        onTap: () {
                          widget.parcelModel.recievedBy = nameController.text;
                          widget.parcelModel.recievedByEmail =
                              mailController.text;
                          widget.parcelModel.recievedByNum = numController.text;
                          widget.parcelModel.recievedByID = idController.text;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) =>
                                  SummaryPage(widget.parcelModel)));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}