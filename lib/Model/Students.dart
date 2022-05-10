// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

List<Students> studentsFromJson(String str) => List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

String studentsToJson(List<Students> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Students {
  Students({
    this.studentId,
    this.studentSchoolId,
    this.firstName,
    this.lastName,
    this.password,
    this.date,
    this.yearnSection,
    this.isEnable,
    this.photo,
    this.file1,
  });

  int? studentId;
  String? studentSchoolId;
  String? firstName;
  String? lastName;
  dynamic password;
  DateTime? date;
  String? yearnSection;
  bool? isEnable;
  dynamic photo;
  dynamic file1;

  factory Students.fromJson(Map<String, dynamic> json) => Students(
    studentId: json["StudentID"],
    studentSchoolId: json["StudentSchoolID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    password: json["Password"],
    date: DateTime.parse(json["Date"]),
    yearnSection: json["YearnSection"],
    isEnable: json["isEnable"],
    photo: json["Photo"],
    file1: json["File1"],
  );

  Map<String, dynamic> toJson() => {
    "StudentID": studentId,
    "StudentSchoolID": studentSchoolId,
    "FirstName": firstName,
    "LastName": lastName,
    "Password": password,
    "Date": date?.toIso8601String(),
    "YearnSection": yearnSection,
    "isEnable": isEnable,
    "Photo": photo,
    "File1": file1,
  };
}
