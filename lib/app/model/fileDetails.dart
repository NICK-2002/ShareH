import 'package:share_h/app/data/fileDetailAtrribute.dart';

class FileDetails {
  final int? id;
  final String fileName;
  String location;
  final DateTime dateTime;

  FileDetails(
      {this.id,
      required this.fileName,
      required this.location,
      required this.dateTime});

  FileDetails copy(
          {int? id, String? filename, String? location, DateTime? dateTime}) =>
      FileDetails(
          id: id ?? this.id,
          fileName: fileName ?? this.fileName,
          location: location ?? this.location,
          dateTime: dateTime ?? this.dateTime);

  static FileDetails fromJson(Map<String, Object?> json) => FileDetails(
      id: json[FileDetailAtrribute.id] as int?,
      fileName: json[FileDetailAtrribute.fileName] as String,
      location: json[FileDetailAtrribute.location] as String,
      dateTime: DateTime.parse(json[FileDetailAtrribute.dateTime] as String));

  Map<String, Object?> toJson() => {
        FileDetailAtrribute.id: id,
        FileDetailAtrribute.fileName: fileName,
        FileDetailAtrribute.location: location,
        FileDetailAtrribute.dateTime: dateTime.toIso8601String(),
      };
}
