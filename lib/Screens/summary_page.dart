import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:fyp_driver/Screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/home.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';
import 'package:line_icons/line_icons.dart';

class SummaryPage extends StatefulWidget {
  ParcelModel parcelModel;

  SummaryPage(this.parcelModel);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 30, 39, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MyAppBar("Deliver", false),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        LineIcons.shippingFast,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 5, 3),
                        child: Text(
                          widget.parcelModel.id,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Received By " +
                            widget.parcelModel.recievedBy.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),

                      /*GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),*/
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: smallLabel(
                                "From", widget.parcelModel.senderName)),
                      ),
                      Expanded(
                        child: Container(
                            child: smallLabel(
                                "To", widget.parcelModel.receiverName)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(LineIcons.envelope),
                      SizedBox(width: 10),
                      Text(
                        widget.parcelModel.recievedByEmail,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(LineIcons.phone),
                      SizedBox(width: 10),
                      Text(
                        widget.parcelModel.recievedByNum,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(LineIcons.passport),
                      SizedBox(width: 10),
                      Text(
                        widget.parcelModel.recievedByID,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.parcelModel.type +
                        " - " +
                        widget.parcelModel.parcelType,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Delivery Date and Time",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateTime.now().toLocal().toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              LineIcons.phone,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.parcelModel.recieverNum,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              LineIcons.box,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.parcelModel.size,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              LineIcons.stream,
                              color: Colors.grey.shade800,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              widget.parcelModel.parcelType,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: GestureDetector(
                      onTap: () {
                        widget.parcelModel.status = "Delivered";
                        confirmDelivery();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget smallLabel(String heading, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }

  confirmDelivery() async {
    try {
      var response = await Dio().put(
          "https://idms.backend.eastdevs.com/api/Parcels/${widget.parcelModel.id}",
          data: {
            "data": {
              "recievedByName": widget.parcelModel.recievedBy,
              "recievedByMail": widget.parcelModel.recievedByEmail,
              "recievedById": widget.parcelModel.recievedByID,
              "recievedByNo": widget.parcelModel.recievedByNum,
              "status": widget.parcelModel.status,
            }
          });
      print(response.data);
      int index = Welcome.scheduledParcelList
          .indexWhere((element) => element.id == widget.parcelModel.id);
      Welcome.deliveredParcelList.add(widget.parcelModel);
      Welcome.scheduledParcelList.removeAt(index);
      Fluttertoast.showToast(msg: "Parcel Delivered");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    } catch (e) {
      print("Exception: $e");
      Fluttertoast.showToast(msg: "Parcel Delivery Failed");
    }
  }
}
