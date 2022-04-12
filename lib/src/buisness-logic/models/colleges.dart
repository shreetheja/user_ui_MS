import 'dart:convert';
import 'package:collection/collection.dart';
class AllCollegesModel {
  final List<College> college;
  AllCollegesModel({
    required this.college,
  });

  AllCollegesModel copyWith({
    List<College>? college,
  }) {
    return AllCollegesModel(
      college: college ?? this.college,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'college': college.map((x) => x.toMap()).toList(),
    };
  }

  factory AllCollegesModel.fromMap(Map<String, dynamic> map) {
    return AllCollegesModel(
      college: List<College>.from(map['data']?.map((x) => College.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCollegesModel.fromJson(String source) => AllCollegesModel.fromMap(json.decode(source));

  @override
  String toString() => 'AllColleges(college: $college)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is AllCollegesModel &&
      listEquals(other.college, college);
  }

  @override
  int get hashCode => college.hashCode;
}

class College {
  final String c_id;
  final String c_name;
  College({
    required this.c_id,
    required this.c_name,
  });

  College copyWith({
    String? c_id,
    String? c_name,
  }) {
    return College(
      c_id: c_id ?? this.c_id,
      c_name: c_name ?? this.c_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'c_id': c_id,
      'c_name': c_name,
    };
  }

  factory College.fromMap(Map<String, dynamic> map) {
    return College(
      c_id: map['c_id'] ?? '',
      c_name: map['c_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory College.fromJson(String source) => College.fromMap(json.decode(source));

  @override
  String toString() => 'College(c_id: $c_id, c_name: $c_name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is College &&
      other.c_id == c_id &&
      other.c_name == c_name;
  }

  @override
  int get hashCode => c_id.hashCode ^ c_name.hashCode;
}