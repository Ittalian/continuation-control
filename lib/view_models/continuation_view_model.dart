import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/services/continuation_service.dart';
import 'package:flutter/foundation.dart';

class ContinuationViewModel extends ChangeNotifier {
  final ContinuationService continuationService;

  Map<String, Map<Continuation, List<Doing>>> _continuationMap = {};
  Map<String, Map<Continuation, List<Doing>>> get continuationMap =>
      _continuationMap;

  ContinuationViewModel(this.continuationService) {
    fetchContinuations();
  }

  void fetchContinuations() {
    _continuationMap.clear();
    fetchAndAddContinuationWithDoings('in_progress');
    fetchAndAddContinuationWithDoings('completed');
    fetchAndAddContinuationWithDoings('pending');
  }

  void fetchAndAddContinuationWithDoings(String status) {
    continuationService.getContinuationWithDoings(status).listen(
      (continuationWithDoings) {
        _continuationMap[status] = continuationWithDoings;
        notifyListeners();
      },
      onError: (error) {
        print('エラーです\n$error');
      },
    );
  }

  Future<void> addContinuation(Continuation continuation) async {
    await continuationService.addContinuation(continuation);
    fetchContinuations();
  }

  Future<void> updateContinuation(Continuation continuation) async {
    await continuationService.updateContinuation(continuation);
    fetchContinuations();
  }

  Future<void> deleteContinuation(String continuationId) async {
    await continuationService.deleteContinuation(continuationId);
    fetchContinuations();
  }
}
