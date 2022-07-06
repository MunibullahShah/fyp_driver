import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:fyp_driver/Screens/app_bar.dart';
import 'package:fyp_driver/Screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/welcome_page.dart';

class DestinationsPage extends StatefulWidget {
  @override
  _DestinationsPageState createState() => _DestinationsPageState();
}

class _DestinationsPageState extends State<DestinationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MyAppBar("Destinations", true),
      ),
      body: (Welcome.scheduledParcelList.length == 0)
          ? Center(
              child: Container(
              child: Text("No Deliveries"),
            ))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      "Next Destination",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 1.2,
                          wordSpacing: 1.2),
                    ),
                  ),
                  tile(Welcome.scheduledParcelList[0]),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Text(
                      "Upcomming",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1.2,
                          wordSpacing: 1.2),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: Welcome.scheduledParcelList.length - 1,
                        itemBuilder: (context, index) {
                          return tile(Welcome.scheduledParcelList[index + 1]);
                        }),
                  )
                ],
              ),
            ),
    );
  }

  Widget tile(ParcelModel parcel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Container(
        //height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 5)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    parcel.id,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    parcel.type,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: parcel.type == "Delivered"
                          ? Colors.green
                          : Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parcel.receiverName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    parcel.address,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => DetailsScreen(parcel)));
                },
                child: Column(
                  children: [
                    const Text(
                      "Details >",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.12,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
