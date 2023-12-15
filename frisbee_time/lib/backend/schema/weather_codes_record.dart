import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeatherCodesRecord extends FirestoreRecord {
  WeatherCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "WMOCode" field.
  int? _wMOCode;
  int get wMOCode => _wMOCode ?? 0;
  bool hasWMOCode() => _wMOCode != null;

  // "isDay" field.
  bool? _isDay;
  bool get isDay => _isDay ?? false;
  bool hasIsDay() => _isDay != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _wMOCode = castToType<int>(snapshotData['WMOCode']);
    _isDay = snapshotData['isDay'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weatherCodes');

  static Stream<WeatherCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeatherCodesRecord.fromSnapshot(s));

  static Future<WeatherCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeatherCodesRecord.fromSnapshot(s));

  static WeatherCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeatherCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeatherCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeatherCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeatherCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeatherCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeatherCodesRecordData({
  int? wMOCode,
  bool? isDay,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'WMOCode': wMOCode,
      'isDay': isDay,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeatherCodesRecordDocumentEquality
    implements Equality<WeatherCodesRecord> {
  const WeatherCodesRecordDocumentEquality();

  @override
  bool equals(WeatherCodesRecord? e1, WeatherCodesRecord? e2) {
    return e1?.wMOCode == e2?.wMOCode &&
        e1?.isDay == e2?.isDay &&
        e1?.image == e2?.image;
  }

  @override
  int hash(WeatherCodesRecord? e) =>
      const ListEquality().hash([e?.wMOCode, e?.isDay, e?.image]);

  @override
  bool isValidKey(Object? o) => o is WeatherCodesRecord;
}
