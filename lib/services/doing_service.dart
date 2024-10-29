import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:continuation_control/models/doing.dart';

class DoingService {
  final db = FirebaseFirestore.instance.collection('Doing');

  Stream<List<Doing>> getDoingById(String continuationId) {
    return db
        .where('continuation_id', isEqualTo: continuationId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Doing.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<void> addDoing(Doing doing) {
    return db.add(doing.toMap());
  }

  Future<void> updateDoing(Doing doing) {
    if (doing.currentPeriod > doing.maxPeriod) {
      doing = doing.maxPeriodUpdatedDoing(maxPeriod: doing.currentPeriod);
    }
    return db.doc(doing.doingId).set(doing.toMap());
  }

  Future<void> deleteDoing(String doingId) {
    return db.doc(doingId).delete();
  }
}
