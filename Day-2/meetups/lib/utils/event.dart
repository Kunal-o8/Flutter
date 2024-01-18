class Event {
  final String id;
  final String title;
  final String description;
  final String image;
  final String location;
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
}
