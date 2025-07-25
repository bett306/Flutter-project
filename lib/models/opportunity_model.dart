class Opportunity {
  final String id;
  final String title;
  final String description;
  final String type;
  final String deadline;
  final String applyLink;

  Opportunity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.deadline,
    required this.applyLink,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      type: json['type']?.toString() ?? 'General',
      deadline: json['deadline']?.toString() ?? 'Not specified',
      applyLink: json['applyLink']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'type': type,
    'deadline': deadline,
    'applyLink': applyLink,
  };
}
