import 'package:continuation_control/models/doing.dart';
import 'package:continuation_control/services/doing_service.dart';
import 'package:flutter/foundation.dart';

class DoingViewModel extends ChangeNotifier {
  final DoingService doingService;

  List<Doing> _doings = [];
  List<Doing> get doings => _doings;

  DoingViewModel(this.doingService);

  Future<void> addDoing(String continuationId, Doing doing) async {
    await doingService.addDoing(continuationId, doing);
  }

  Future<void> updateDoing(String continuationId, Doing doing) async {
    await doingService.updateDoing(continuationId, doing);
  }

  Future<void> deleteDoing(String continuationId, String doingId) async {
    await doingService.deleteDoing(continuationId, doingId);
  }
}
