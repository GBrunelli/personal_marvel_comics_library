import 'result_model.dart';
import 'data_container.dart';

class DataWrapper<T extends Result> {
  DataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });
  late final int code;
  late final String status;
  late final String copyright;
  late final String attributionText;
  late final String attributionHTML;
  late final DataContainer<T> data;
  late final String etag;

  DataWrapper.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json) creator){
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = DataContainer<T>.fromJson(json['data'], creator);
  }
}