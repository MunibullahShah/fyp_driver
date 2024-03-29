class ParcelModel {
  String id;
  String receiverName;
  double longitude;
  double latitude;
  String sendingDate;
  String address;
  String recieverNum;
  String status;
  double parcelWeight;
  String senderName;
  String senderNum;
  String parcelType;
  String size;
  String type;
  String recievedBy = "";
  String recievedByNum = "";
  String recievedByEmail = "";
  String recievedByID = "";
  String deliveryType;
  int destinationNo;

  ParcelModel(
      {required this.id,
      required this.receiverName,
      required this.longitude,
      required this.latitude,
      required this.sendingDate,
      required this.address,
      required this.recieverNum,
      required this.status,
      required this.parcelWeight,
      required this.senderName,
      required this.senderNum,
      required this.parcelType,
      required this.size,
      required this.type,
      required this.destinationNo,
      required this.deliveryType});
}
