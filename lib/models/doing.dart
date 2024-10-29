class Doing {
  final String? doingId;
  final String continuationId;
  final String name;
  final int maxPeriod;
  final int currentPeriod;
  final int goalPeriod;

  Doing({
    this.doingId,
    required this.continuationId,
    required this.name,
    required this.maxPeriod,
    required this.currentPeriod,
    required this.goalPeriod,
  });

  factory Doing.fromMap(Map<String, dynamic> map, String documentId) {
    return Doing(
      doingId: documentId,
      continuationId: map['continuation_id'],
      name: map['name'],
      maxPeriod: map['max_period'],
      currentPeriod: map['current_period'],
      goalPeriod: map['goal_period'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'continuation_id': continuationId,
      'name': name,
      'max_period': maxPeriod,
      'current_period': currentPeriod,
      'goal_period': goalPeriod,
    };
  }

  Doing maxPeriodUpdatedDoing({int? maxPeriod}) {
    return Doing(
      doingId: doingId,
      continuationId: continuationId,
      name: name,
      maxPeriod: maxPeriod ?? this.maxPeriod,
      currentPeriod: currentPeriod,
      goalPeriod: goalPeriod,
    );
  }
}
