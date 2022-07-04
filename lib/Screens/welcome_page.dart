import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/profile_screen.dart';

import '../Models/parcel_model.dart';
import '../login_page.dart';
import 'home.dart';

class Welcome extends StatefulWidget {
  String driverID;

  static List<ParcelModel> deliveredParcelList = [];
  static List<ParcelModel> scheduledParcelList = [];

  @override
  State<Welcome> createState() => _WelcomeState();

  Welcome(this.driverID);
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    getProfileImage();
  }

  bool isLoading = false;
  bool isFound = true;

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
              : isFound
                  ? Column(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  isLoading = true;
                                  setState(() {});
                                  getData();
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
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "No Deliveries for now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300),
                        ),
                        Expanded(
                          child: Container(),
                        ),
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
                      ],
                    ),
        ),
      ),
    );
  }

  getData() async {

    var response = await Dio().get(
        "https://idms.backend.eastdevs.com/api/parcels?filters[route][id][\$eq]=$routeID");
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

      if (parcel.status == "Delivered" || parcel.status == "Failed") {
        deliveredParcelList.add(parcel);

      } else {
        if (!Welcome.scheduledParcelList
            .any((element) => (element.id == parcel.id))) {
          Welcome.scheduledParcelList.add(parcel);
        }
      }
    });

    Welcome.deliveredParcelList.sort((p1, p2) {
      return Comparable.compare(p1.destinationNo, p2.destinationNo);
    });
    Welcome.scheduledParcelList.sort((p1, p2) {
      return Comparable.compare(p1.destinationNo, p2.destinationNo);
    });
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => HomeScreen(),
      ),
    );
  }

  Future<void> getProfileImage() async {
    var response = await Dio().get(
        "https://idms.backend.eastdevs.com/api/drivers?filters[email][\$eq]=${LoginPage.driver.Email}&populate=image");

    EditProfilePage.profilePic = "https://idms.backend.eastdevs.com" +
        response.data["data"][0]["attributes"]["image"]["data"]["attributes"]
            ["formats"]["thumbnail"]["url"];
  }
}
