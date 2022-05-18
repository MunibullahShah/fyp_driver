import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Models/parcel_model.dart';
import '../login_page.dart';
import 'home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;
  List<ParcelModel> deliveredParcelList = [];
  List<ParcelModel> scheduledParcelList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(31, 30, 39, 1),
        body: Container(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage("assets/pics/aaaa.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "WORK HARD.",
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
                    Expanded(
                      child: Container(),
                    ),
                    /*Container(
                      width: 99,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: signInButton,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: GestureDetector(
                          onTap: () {
                            getData();
                            setState(() {
                              isLoading = true;
                            });
                          },
                          child: const Text(
                            'Start Delivering',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),*/
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
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoading = true;
                              });
                              getData();
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: const Text(
                              'Start Deliveries',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(31, 30, 39, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  getData() async {
    // var response =
    //     await Dio().get("https://idms.backend.eastdevs.com/api/routes/3");

    var response = await Dio().get(
        "https://idms.backend.eastdevs.com/api/parcels?filters[route][id][\$eq]=1");
    print(response.data['data'][0]);
    response.data['data'].forEach((e) {
      ParcelModel parcel = ParcelModel(
          id: e["id"].toString(),
          receiverName: e["attributes"]["receiverName"],
          longitude: e["attributes"]["longitude"],
          latitude: e["attributes"]["latitude"],
          address: e["attributes"]["address"],
          status: e["attributes"]["status"],
          recieverNum: e["attributes"]["receiverContact"],
          senderName: e["attributes"]["senderName"],
          senderNum: e["attributes"]["senderContact"],
          parcelType: e["attributes"]["type"],
          size: e["attributes"]["parcelSize"],
          type: e["attributes"]["deliveryType"],
          parcelWeight: e["attributes"]["parcelWeight"],
          destinationNo: e["attributes"]["destinationNo"] == null
              ? 0
              : int.parse(e["attributes"]["destinationNo"]),
          sendingDate: '',
          deliveryType: e["attributes"]["deliveryType"]);
      if (parcel.status == "Delivered") {
        deliveredParcelList.add(parcel);
      } else {
        scheduledParcelList.add(parcel);
      }
    });

    deliveredParcelList.sort((p1, p2) {
      return Comparable.compare(p1.destinationNo, p2.destinationNo);
    });
    scheduledParcelList.sort((p1, p2) {
      return Comparable.compare(p1.destinationNo, p2.destinationNo);
    });
    deliveredParcelList.forEach((element) {
      print(element.destinationNo);
    });
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => HomeScreen(
            3, "munib@gmail.com", deliveredParcelList, scheduledParcelList),
      ),
    );
  }
}
