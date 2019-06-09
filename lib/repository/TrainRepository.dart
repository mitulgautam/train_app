import 'package:train_app/models/trainData.dart';
import 'package:train_app/resources/apiProvider.dart';

class TrainRepository {
  Future<TrainList> getTrainData(String trainNumber) {
    Future<TrainList> data = ApiProvider.getTrainDetails(trainNumber);
    return data;
  }
}
