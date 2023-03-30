
class DoctorModel {
  DoctorModel({
    required this.id,
    required this.name,
    this.photo,
    required this.photoNationalId,
    required this.photoWorkPermit,
    required this.photoDoctorsSyndicate,
    required this.yearsExp,
    required this.doctorSsn,
    required this.description,
    required this.phoneNumber,
    required this.nameDepartment,
    required this.age,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.servicePrice,
    required this.acceptance,
    required this.acceptanceEdit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic photo;
  String photoNationalId;
  String photoWorkPermit;
  String photoDoctorsSyndicate;
  int yearsExp;
  int doctorSsn;
  String description;
  int phoneNumber;
  String nameDepartment;
  int age;
  String gender;
  double latitude;
  double longitude;
  int userId;
  String servicePrice;
  int acceptance;
  int acceptanceEdit;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json["id"],
    name: json["DName"],
    photo: json["Photo"],
    photoNationalId: json["Photo_National_ID"],
    photoWorkPermit: json["Photo_Work_Permit"],
    photoDoctorsSyndicate: json["Photo_Doctors_Syndicate"],
    yearsExp: json["Years_Exp"],
    doctorSsn: json["Doctor_Ssn"],
    description: json["Description"],
    phoneNumber: json["Phone_Number"],
    nameDepartment: json["Name_Department"],
    age: json["Age"],
    gender: json["Gender"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    userId: json["User_Id"],
    servicePrice: json["Service_Price"],
    acceptance: json["Acceptance"],
    acceptanceEdit: json["Acceptance_Edit"],
    status: json["Status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "DName": name,
    "Photo": photo,
    "Photo_National_ID": photoNationalId,
    "Photo_Work_Permit": photoWorkPermit,
    "Photo_Doctors_Syndicate": photoDoctorsSyndicate,
    "Years_Exp": yearsExp,
    "Doctor_Ssn": doctorSsn,
    "Description": description,
    "Phone_Number": phoneNumber,
    "Name_Department": nameDepartment,
    "Age": age,
    "Gender": gender,
    "latitude": latitude,
    "longitude": longitude,
    "User_Id": userId,
    "Service_Price": servicePrice,
    "Acceptance": acceptance,
    "Acceptance_Edit": acceptanceEdit,
    "Status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
