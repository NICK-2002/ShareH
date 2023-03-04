class FileDetails {
  int? _id;
  String? _fileName;
  String? _loaction;
  DateTime? _dateTime;

  FileDetails({int? id, String? fileName, String? loaction, DateTime? dateTime}) {
    if (id != null) {
      this._id = id;
    }
    if (fileName != null) {
      this._fileName = fileName;
    }
    if (loaction != null) {
      this._loaction = loaction;
    }
    if (dateTime != null) {
      this._dateTime = dateTime;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String get fileName => _fileName??"";
  set fileName(String fileName) => _fileName = fileName;
  String get loaction => _loaction??"";
  set loaction(String loaction) => _loaction = loaction;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? dateTime) => _dateTime = dateTime;

  FileDetails.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fileName = json['FileName'];
    _loaction = json['Loaction'];
    _dateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['FileName'] = this._fileName;
    data['Loaction'] = this._loaction;
    data['DateTime'] = this._dateTime;
    return data;
  }
}