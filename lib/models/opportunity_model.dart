class Opportunity {
  final String id;
  final String title;
  final String description;
  final String deadline;
  final String type;
  final String applyLink;

  Opportunity({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.type,
    required this.applyLink,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      deadline: json['deadline'],
      type: json['type'],
      applyLink: json['applyLink'],
    );
  }

  static List<Opportunity> fromList(List<dynamic> jsonList) {
    return jsonList.map((json) => Opportunity.fromJson(json)).toList();
  }

  @override
  String toString() => 'Opportunity(title: $title, type: $type)';
}
