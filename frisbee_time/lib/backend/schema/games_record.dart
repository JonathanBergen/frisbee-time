import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_sent" field.
  bool? _notificationSent;
  bool get notificationSent => _notificationSent ?? false;
  bool hasNotificationSent() => _notificationSent != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "temp" field.
  double? _temp;
  double get temp => _temp ?? 0.0;
  bool hasTemp() => _temp != null;

  // "players" field.
  List<DocumentReference>? _players;
  List<DocumentReference> get players => _players ?? const [];
  bool hasPlayers() => _players != null;

  // "precipitation" field.
  double? _precipitation;
  double get precipitation => _precipitation ?? 0.0;
  bool hasPrecipitation() => _precipitation != null;

  // "game_is_played" field.
  bool? _gameIsPlayed;
  bool get gameIsPlayed => _gameIsPlayed ?? false;
  bool hasGameIsPlayed() => _gameIsPlayed != null;

  // "gametime_utc" field.
  DateTime? _gametimeUtc;
  DateTime? get gametimeUtc => _gametimeUtc;
  bool hasGametimeUtc() => _gametimeUtc != null;

  // "wind" field.
  double? _wind;
  double get wind => _wind ?? 0.0;
  bool hasWind() => _wind != null;

  void _initializeFields() {
    _notificationSent = snapshotData['notification_sent'] as bool?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _temp = castToType<double>(snapshotData['temp']);
    _players = getDataList(snapshotData['players']);
    _precipitation = castToType<double>(snapshotData['precipitation']);
    _gameIsPlayed = snapshotData['game_is_played'] as bool?;
    _gametimeUtc = snapshotData['gametime_utc'] as DateTime?;
    _wind = castToType<double>(snapshotData['wind']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGamesRecordData({
  bool? notificationSent,
  DateTime? timeCreated,
  double? temp,
  double? precipitation,
  bool? gameIsPlayed,
  DateTime? gametimeUtc,
  double? wind,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_sent': notificationSent,
      'time_created': timeCreated,
      'temp': temp,
      'precipitation': precipitation,
      'game_is_played': gameIsPlayed,
      'gametime_utc': gametimeUtc,
      'wind': wind,
    }.withoutNulls,
  );

  return firestoreData;
}

class GamesRecordDocumentEquality implements Equality<GamesRecord> {
  const GamesRecordDocumentEquality();

  @override
  bool equals(GamesRecord? e1, GamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notificationSent == e2?.notificationSent &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.temp == e2?.temp &&
        listEquality.equals(e1?.players, e2?.players) &&
        e1?.precipitation == e2?.precipitation &&
        e1?.gameIsPlayed == e2?.gameIsPlayed &&
        e1?.gametimeUtc == e2?.gametimeUtc &&
        e1?.wind == e2?.wind;
  }

  @override
  int hash(GamesRecord? e) => const ListEquality().hash([
        e?.notificationSent,
        e?.timeCreated,
        e?.temp,
        e?.players,
        e?.precipitation,
        e?.gameIsPlayed,
        e?.gametimeUtc,
        e?.wind
      ]);

  @override
  bool isValidKey(Object? o) => o is GamesRecord;
}
