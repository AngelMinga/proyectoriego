import 'dart:convert';

class TopicModel {
  String? topic;
  double? data;

  TopicModel({
    this.topic,
    this.data,
  });

  factory TopicModel.fromJson(String str) => TopicModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TopicModel.fromMap(Map<String, dynamic> json) => TopicModel(
    topic: json["topic"],
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "topic": topic,
    "data": data,
  };
}