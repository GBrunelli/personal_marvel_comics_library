import 'result_model.dart';

class DataContainer<T extends Result> {

  late final int offset;
  late final int limit;
  late final int total;
  late final int count;
  late final List<T> result;

  DataContainer.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json) creator) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    result = List.from(json['results']).map((e)=>creator(e)).toList();
  }
}

