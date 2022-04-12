import 'dart:convert';
import 'package:collection/collection.dart';

class AllBatchesModel {
  final List<Batch> batch;
  AllBatchesModel({
    required this.batch,
  });

  AllBatchesModel copyWith({
    List<Batch>? batch,
  }) {
    return AllBatchesModel(
      batch: batch ?? this.batch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batch': batch.map((x) => x.toMap()).toList(),
    };
  }

  factory AllBatchesModel.fromMap(Map<String, dynamic> map) {
    return AllBatchesModel(
      batch: List<Batch>.from(map['data']?.map((x) => Batch.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllBatchesModel.fromJson(String source) => AllBatchesModel.fromMap(json.decode(source));

  @override
  String toString() => 'AllBatchesModel(batch: $batch)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is AllBatchesModel &&
      listEquals(other.batch, batch);
  }

  @override
  int get hashCode => batch.hashCode;
}

class Batch {
  final String b_id;
  final String b_desc;
  Batch({
    required this.b_id,
    required this.b_desc,
  });

  Batch copyWith({
    String? b_id,
    String? b_desc,
  }) {
    return Batch(
      b_id: b_id ?? this.b_id,
      b_desc: b_desc ?? this.b_desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'b_id': b_id,
      'b_desc': b_desc,
    };
  }

  factory Batch.fromMap(Map<String, dynamic> map) {
    return Batch(
      b_id: map['b_id'] ?? '',
      b_desc: map['b_desc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Batch.fromJson(String source) => Batch.fromMap(json.decode(source));

  @override
  String toString() => 'Batch(b_id: $b_id, b_desc: $b_desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Batch &&
      other.b_id == b_id &&
      other.b_desc == b_desc;
  }

  @override
  int get hashCode => b_id.hashCode ^ b_desc.hashCode;
}