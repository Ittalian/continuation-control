import 'package:continuation_control/models/continuation.dart';
import 'package:continuation_control/services/continuation_service.dart';
import 'package:flutter/foundation.dart';

class ContinuationViewModel extends ChangeNotifier {
  final ContinuationService continuationService;

  Map<String, List<Continuation>> _continuationMap = {};
  Map<String, List<Continuation>> get continuationMap => _continuationMap;

  ContinuationViewModel(this.continuationService) {
    fetchContinuations();
  }

  void fetchContinuations() {
    continuationService.getContinuations().listen((continuationMap) {
      _continuationMap = continuationMap;
      notifyListeners();
    });
  }

  Future<void> addContinuation(Continuation continuation) async {
    return await continuationService.addContinuation(continuation);
  }

  Future<void> updateContinuation(Continuation continuation) async {
    return await continuationService.updateContinuation(continuation);
  }

  Future<void> deleteContinuation(String continuationId) async {
    return await continuationService.deleteContinuation(continuationId);
  }
}
