class DateModel {
  DateModel({
    required this.type,
    required this.date,
  });

  late final String type;
  late final String date;

  DateModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    date = json['date'];
  }
}