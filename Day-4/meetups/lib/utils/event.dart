import 'location.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final String image;
  final Location location;
  final List<DateTime> dates;
  final List<String> members;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
    required this.dates,
    this.members = const [], // default value
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      location: Location.fromJson(json['location']),
      dates:
          (json['dates'] as List).map((date) => DateTime.parse(date)).toList(),
      members: List<String>.from(json['members']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'location': location.toJson(),
      'dates': dates.map((date) => date.toIso8601String()).toList(),
      'members': members,
    };
  }
}
