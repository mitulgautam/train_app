import 'dart:async';

import 'package:train_app/models/trainData.dart';
import 'package:train_app/repository/TrainRepository.dart';

class TrainBloc {
  StreamController<TrainList> _streamController = StreamController<TrainList>();

  StreamSink<TrainList> get sink => _streamController.sink;

  Stream<TrainList> get stream => _streamController.stream;

  getTrainData(String trainNumber) {
    TrainRepository trainRepository = TrainRepository();
    Future<TrainList> data = trainRepository.getTrainData(trainNumber);
    data.then((receivedData) {
      sink.add(receivedData);
    });
  }

  dispose() {
    _streamController.close();
  }
}
