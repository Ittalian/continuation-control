import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/services/doing_service.dart';
import 'package:flutter/foundation.dart';

class DoingViewModel extends ChangeNotifier {
  final DoingService doingService;

  List<Doing> _doings = [];
  List<Doing> get doings => _doings;

  DoingViewModel(this.doingService);

  Future<void> fetchDoings(String continuationId) async {
    doingService.getDoingById(continuationId).listen((doingList) {
      _doings = doingList;
      notifyListeners();
    });
  }

  Future<void> addDoing(Doing doing) async {
    await doingService.addDoing(doing);
  }

  Future<void> updateDoing(Doing doing) async {
    await doingService.updateDoing(doing);
  }

  Future<void> deleteDoing(String doingId) async {
    await doingService.deleteDoing(doingId);
  }
}
