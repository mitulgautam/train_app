class TrainData {
  String number;
  String name;
}

class TrainList {
  TrainData data = TrainData();

  TrainList.json(Map<String, dynamic> jsonParsedData) {
    data.name = jsonParsedData['train']['name'];
    data.number = jsonParsedData['train']['number'];
  }
}
