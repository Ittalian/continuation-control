import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:continuation_control/models/doing.dart';

class DoingService {
  final db = FirebaseFirestore.instance;

  Future<void> addDoing(String continuationId, Doing doing) {
    return db
        .collection('Continuation')
        .doc(continuationId)
        .collection('Doing')
        .add(doing.toMap());
  }

  Future<void> updateDoing(String continuationId, Doing doing) {
    if (doing.currentPeriod > doing.maxPeriod) {
      doing = doing.maxPeriodUpdatedDoing(maxPeriod: doing.currentPeriod);
    }
    return db
        .collection('Continuation')
        .doc(continuationId)
        .collection('Doing')
        .doc(doing.doingId)
        .set(doing.toMap());
  }

  Future<void> deleteDoing(String continuationId, String doingId) {
    return db
        .collection('Continuation')
        .doc(continuationId)
        .collection('Doing')
        .doc(doingId)
        .delete();
  }
}
