import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/models/doing.dart';

class ContinuationService {
  final db = FirebaseFirestore.instance.collection('Continuation');

  Stream<Map<Continuation, List<Doing>>> getContinuationWithDoings(
      String status) {
    return db.where('status', isEqualTo: status).snapshots().asyncMap(
      (continuationSnapshot) async {
        Map<Continuation, List<Doing>> continuationWithDoings = {};

        for (var continuationDoc in continuationSnapshot.docs) {
          Continuation continuation = Continuation.fromMap(
            continuationDoc.data(),
            continuationDoc.id,
          );

          final doingSnapshot =
              await db.doc(continuationDoc.id).collection('Doing').get();
          List<Doing> doings = doingSnapshot.docs
              .map((doingDoc) => Doing.fromMap(doingDoc.data(), doingDoc.id))
              .toList();

          continuationWithDoings[continuation] = doings;
        }

        return continuationWithDoings;
      },
    );
  }

  Stream<Map<String, List<Continuation>>> getContinuations() {
    return db.snapshots().map((snapshot) {
      List<Continuation> inProgressContinuations = [];
      List<Continuation> completedContinuations = [];
      List<Continuation> pendingContinuations = [];

      for (var doc in snapshot.docs) {
        Continuation continuation = Continuation.fromMap(doc.data(), doc.id);

        switch (continuation.status) {
          case 'in_progress':
            inProgressContinuations.add(continuation);
            break;
          case 'completed':
            completedContinuations.add(continuation);
            break;
          case 'pending':
            pendingContinuations.add(continuation);
            break;
        }
      }

      return {
        'in_progress': inProgressContinuations,
        'completed': completedContinuations,
        'pending': pendingContinuations,
      };
    });
  }

  Future<void> addContinuation(Continuation continuation) {
    return db.add(continuation.toMap());
  }

  Future<void> updateContinuation(Continuation continuation) {
    return db.doc(continuation.continuationId).set(continuation.toMap());
  }

  Future<void> deleteContinuation(String continuationId) {
    return db.doc(continuationId).delete();
  }
}
