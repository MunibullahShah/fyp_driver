class DriverModel {
  String id;
  String Name;
  String Email;
  String password;
  String PhoneNo;
  String Age;
  String Male;
  String Nic;
  String Address;
  String createdAt;
  String updatedAt;
  String publishedAt;
  String availableOrUnavailableStatus;
  String liscenceNo;
  String q1;
  String q2;
  String q3;
  String a1;
  String a2;
  String a3;
  DriverModel(
      this.id,
      this.Name,
      this.Email,
      this.password,
      this.PhoneNo,
      this.Age,
      this.Male,
      this.Nic,
      this.Address,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.availableOrUnavailableStatus,
      this.liscenceNo,
      this.q1,
      this.q2,
      this.q3,
      this.a1,
      this.a2,
      this.a3);

  static DriverModel fromMap(String id, Map<dynamic, dynamic> map) {
    print(map["Email"].toString());
    return DriverModel(
        map["id"].toString(),
        map["Name"].toString(),
        map["Email"].toString(),
        map["password"].toString(),
        map["PhoneNo"].toString(),
        map["Age"].toString(),
        map["Male"].toString(),
        map["Nic"].toString(),
        map["Address"].toString(),
        map["createdAt"].toString(),
        map["updatedAt"].toString(),
        map["publishedAt"].toString(),
        map["availableOrUnavailableStatus"].toString(),
        map["liscenceNo"].toString(),
        map["q1"].toString(),
        map["q2"].toString(),
        map["q3"].toString(),
        map["a1"].toString(),
        map["a2"].toString(),
        map["a3"].toString());
  }
}
