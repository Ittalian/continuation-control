class Continuation {
  final String? continuationId;
  final String name;
  final String status;

  Continuation({
    this.continuationId,
    required this.name,
    required this.status,
  });

  factory Continuation.fromMap(Map<String, dynamic> map, String documentId) {
    return Continuation(
      continuationId: documentId,
      name: map['name'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'status': status,
    };
  }
}
