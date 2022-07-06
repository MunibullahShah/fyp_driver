import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:fyp_driver/Screens/app_bar.dart';
import 'package:fyp_driver/Screens/recepient_details_page.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();

  ParcelModel parcelModel;

  DetailsScreen(this.parcelModel);
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MyAppBar("Details", true),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (0.88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 30, 39, 1),
                        //Color.fromRGBO(255, 214, 77, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(58, 57, 62, 0.4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: smallLabel("From",
                                                widget.parcelModel.senderName)),
                                      ),
                                      Expanded(
                                        child: Container(
                                            child: smallLabel(
                                                "To",
                                                widget
                                                    .parcelModel.receiverName)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  smallLabel(
                                      "Address",
                                      "House num 123, Block A, LDA Avenue " +
                                          widget.parcelModel.address),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    widget.parcelModel.recieverNum,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
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
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    widget.parcelModel.size,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
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
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    widget.parcelModel.parcelType,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                label("Sender Name: ", widget.parcelModel.senderName),
                label("Sender Contact: ", widget.parcelModel.senderNum),
                const SizedBox(
                  height: 12,
                ),
                label("Type: ", widget.parcelModel.parcelType),
                label("Size: ", widget.parcelModel.size),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    openMap(widget.parcelModel.latitude,
                        widget.parcelModel.latitude);
                  },
                  child: button(
                      widget.parcelModel.status == "Delivered"
                          ? "Show Map"
                          : widget.parcelModel.status == "Failed"
                              ? "Start Ride Again"
                              : "Start Ride",
                      widget.parcelModel.address),
                ),
                const SizedBox(
                  height: 15,
                ),
                (widget.parcelModel.status != "Delivered")
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) =>
                                  RecpientDetailsPage(widget.parcelModel)));
                        },
                        child: button("Deliver", widget.parcelModel.id),
                      )
                    : const SizedBox(
                        height: 1,
                      ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget label(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 2, 10, 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2 - 30,
            child: Text(
              heading,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                value,
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget button(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(179, 137, 0, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Row(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: heading == "Start Ride"
                    ? const Icon(
                        Icons.map_outlined,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.delivery_dining_outlined,
                        color: Colors.white,
                      ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    await launchUrl(Uri.parse(googleUrl));

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  Widget smallLabel(String heading, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
