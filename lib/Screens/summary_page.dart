import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:fyp_driver/Screens/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/home.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class SummaryPage extends StatefulWidget {
  ParcelModel parcelModel;

  SummaryPage(this.parcelModel);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 30, 39, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MyAppBar("Deliver", false),
      ),
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: const BoxDecoration(
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
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Received By " +
                              widget.parcelModel.recievedBy.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
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
                        const Icon(LineIcons.envelope),
                        const SizedBox(width: 10),
                        Text(
                          widget.parcelModel.recievedByEmail,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(LineIcons.phone),
                        const SizedBox(width: 10),
                        Text(
                          widget.parcelModel.recievedByNum,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LineIcons.passport),
                        const SizedBox(width: 10),
                        Text(
                          widget.parcelModel.recievedByID,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
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
                      height: 15,
                    ),
                    const Text(
                      "Type",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.parcelModel.type +
                          " - " +
                          widget.parcelModel.parcelType,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Delivery Date and Time",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateTime.now().toLocal().toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 15,
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
                              const SizedBox(
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
                              const SizedBox(
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
                              const SizedBox(
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
                    Expanded(child: Container()),
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
      ),
    );
  }

  Widget smallLabel(String heading, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        )
      ],
    );
  }

  confirmDelivery() async {
    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = false;
    });
  }
}
