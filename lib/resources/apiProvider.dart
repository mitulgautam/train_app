import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:train_app/constant/constant.dart';
import 'package:train_app/models/trainData.dart';

class ApiProvider {
  // ignore: missing_return
  static Future<TrainList> getTrainDetails(String trainNumber) async {
    final response = await http
        .get(Constant.BASE_URL_TRAIN + trainNumber + "/" + Constant.API_KEY);
    print(Constant.BASE_URL_TRAIN + trainNumber + "/" + Constant.API_KEY);
    print(response.body);

    return TrainList.json(json.decode(response.body));
  }
}
