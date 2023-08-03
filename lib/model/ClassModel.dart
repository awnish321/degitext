// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

List<ClassModel> classModelFromJson(String str) => List<ClassModel>.from(json.decode(str).map((x) => ClassModel.fromJson(x)));

String classModelToJson(List<ClassModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassModel {
  String status;
  String message;
  List<ClassDatum> classData;

  ClassModel({
    required this.status,
    required this.message,
    required this.classData,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    status: json["Status"],
    message: json["Message"],
    classData: List<ClassDatum>.from(json["ClassData"].map((x) => ClassDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "ClassData": List<dynamic>.from(classData.map((x) => x.toJson())),
  };
}

class ClassDatum {
  String classId;
  String className;

  ClassDatum({
    required this.classId,
    required this.className,
  });

  factory ClassDatum.fromJson(Map<String, dynamic> json) => ClassDatum(
    classId: json["Class_Id"],
    className: json["Class_Name"],
  );

  Map<String, dynamic> toJson() => {
    "Class_Id": classId,
    "Class_Name": className,
  };
}
