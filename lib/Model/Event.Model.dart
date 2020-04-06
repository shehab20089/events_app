// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

class Event {
  int id;
  String title;
  List<String> img;
  String interest;
  int price;
  DateTime date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  String latitude;
  String longitude;
  bool isLiked;
  bool isSold;
  bool isPrivateEvent;
  bool hiddenCashPayment;
  int specialForm;
  dynamic questionnaire;
  dynamic questExplanation;
  List<ReservType> reservTypes;
  dynamic questionnaireFields;
  List<dynamic> occasionAgenda;

  Event({
    this.id,
    this.title,
    this.img,
    this.interest,
    this.price,
    this.date,
    this.address,
    this.trainerName,
    this.trainerImg,
    this.trainerInfo,
    this.occasionDetail,
    this.latitude,
    this.longitude,
    this.isLiked,
    this.isSold,
    this.isPrivateEvent,
    this.hiddenCashPayment,
    this.specialForm,
    this.questionnaire,
    this.questExplanation,
    this.reservTypes,
    this.questionnaireFields,
    this.occasionAgenda,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        img: List<String>.from(json["img"].map((x) => x)),
        interest: json["interest"],
        price: json["price"],
        date: DateTime.parse(json["date"]),
        address: json["address"],
        trainerName: json["trainerName"],
        trainerImg: json["trainerImg"],
        trainerInfo: json["trainerInfo"],
        occasionDetail: json["occasionDetail"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isLiked: json["isLiked"],
        isSold: json["isSold"],
        isPrivateEvent: json["isPrivateEvent"],
        hiddenCashPayment: json["hiddenCashPayment"],
        specialForm: json["specialForm"],
        questionnaire: json["questionnaire"],
        questExplanation: json["questExplanation"],
        reservTypes: List<ReservType>.from(
            json["reservTypes"].map((x) => ReservType.fromJson(x))),
        questionnaireFields: json["questionnaireFields"],
        occasionAgenda:
            List<dynamic>.from(json["occasionAgenda"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "img": List<dynamic>.from(img.map((x) => x)),
        "interest": interest,
        "price": price,
        "date": date.toIso8601String(),
        "address": address,
        "trainerName": trainerName,
        "trainerImg": trainerImg,
        "trainerInfo": trainerInfo,
        "occasionDetail": occasionDetail,
        "latitude": latitude,
        "longitude": longitude,
        "isLiked": isLiked,
        "isSold": isSold,
        "isPrivateEvent": isPrivateEvent,
        "hiddenCashPayment": hiddenCashPayment,
        "specialForm": specialForm,
        "questionnaire": questionnaire,
        "questExplanation": questExplanation,
        "reservTypes": List<dynamic>.from(reservTypes.map((x) => x.toJson())),
        "questionnaireFields": questionnaireFields,
        "occasionAgenda": List<dynamic>.from(occasionAgenda.map((x) => x)),
      };
}

class ReservType {
  int id;
  String name;
  int count;
  int price;

  ReservType({
    this.id,
    this.name,
    this.count,
    this.price,
  });

  factory ReservType.fromRawJson(String str) =>
      ReservType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservType.fromJson(Map<String, dynamic> json) => ReservType(
        id: json["id"],
        name: json["name"],
        count: json["count"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "count": count,
        "price": price,
      };
}
