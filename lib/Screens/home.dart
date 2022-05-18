import 'package:dio/dio.dart';
import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:fyp_driver/Screens/Destinations.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/delivered_screen.dart';

class HomeScreen extends StatefulWidget {
  int routID;
  String email;
  List<ParcelModel> scheduleList;
  List<ParcelModel> deliveredList;
  HomeScreen(this.routID, this.email, this.deliveredList, this.scheduleList);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screen = [];
  int selectedIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    screen.add(DestinationsPage(widget.scheduleList));
    screen.add(DeliveredScreen(widget.deliveredList));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "My Parcels"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Delivered")
        ],
      ),
      body: screen[selectedIndex],
    );
  }

  // getData() async {
  //   var response = await Dio().get(
  //       "https://idms.backend.eastdevs.com/api/parcels?filters[route][id][\$eq]=1");
  //   print(response.data['data'][0]);
  //   response.data['data'].forEach((e) {
  //     ParcelModel parcel = ParcelModel(
  //       id: e["id"].toString(),
  //       receiverName: e["attributes"]["receiverName"],
  //       longitude: e["attributes"]["longitude"],
  //       latitude: e["attributes"]["latitude"],
  //       address: e["attributes"]["address"],
  //       status: e["attributes"]["status"],
  //       recieverNum: e["attributes"]["receiverContact"],
  //       senderName: e["attributes"]["senderName"],
  //       senderNum: e["attributes"]["senderContact"],
  //       parcelType: e["attributes"]["type"],
  //       size: e["attributes"]["parcelSize"],
  //       type: e["attributes"]["deliveryType"],
  //       recievedBy: '',
  //       recievedByEmail: '',
  //       recievedByNum: '',
  //       sendingDate: '',
  //       recievedByID: '',
  //       parcelWeight: e["attributes"]["parcelWeight"],
  //       destinationNo: e["attributes"]["destinationNo"] == null
  //           ? 0
  //           : e["attributes"]["destinationNo"],
  //     );
  //     print(parcel.id);
  //     if (parcel.status == "Delivered") {
  //       deliveredParcelList.add(parcel);
  //     } else {
  //       scheduledParcelList.add(parcel);
  //     }
  //   });
  //   screen[0] = DestinationsPage(scheduledParcelList);
  //   screen[1] = DeliveredScreen(scheduledParcelList);
  //   setState(() {
  //     print("hello");
  //   });
  // }
}
