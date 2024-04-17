class GetRecord {
  Data? data;

  GetRecord({
    this.data,
  });
}

class Data {
  String? id;
  String? title;
  String? date;
  List<dynamic>? symptoms;
  List<String>? diagnosis;
  List<String>? treatment;
  List<String>? reports;
  String? userId;

  Data({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.reports,
    this.userId,
  });
}
