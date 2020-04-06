import 'dart:convert';

import 'package:events_app/Model/Event.Model.dart';
import 'package:http/http.dart' as http;

class EventService {
  static const _baseurl =
      'http://skillzycp.com/api/UserApi/getOneOccasion/389/0';
  static Future<Event> getEvent() async {
    var response = await http.get(_baseurl);
    var jsonData = json.decode(response.body);
    var event = Event.fromJson(json.decode(jsonData));
    return event;
  }
}
