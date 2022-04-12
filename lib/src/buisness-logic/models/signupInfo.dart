import 'dart:convert';

import 'package:user_ms_ui/src/views/signup/signupController.dart';

class SignupData {
  final String u_id;
  final String dob;
  final String c_id;
  final String b_id;
  final String address;
  final String name;
  final String phone;
  final String email;
  final String password;
  SignupData({
    required this.u_id,
    required this.dob,
    required this.c_id,
    required this.b_id,
    required this.address,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  SignupData copyWith({
    String? u_id,
    String? dob,
    String? c_id,
    String? b_id,
    String? address,
    String? name,
    String? phone,
    String? email,
    String? password,
  }) {
    return SignupData(
      u_id: u_id ?? this.u_id,
      dob: dob ?? this.dob,
      c_id: c_id ?? this.c_id,
      b_id: b_id ?? this.b_id,
      address: address ?? this.address,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'u_id': u_id,
      'dob': dob,
      'c_id': c_id,
      'b_id': b_id,
      'address': address,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

  factory SignupData.fromMap(Map<String, dynamic> map) {
    return SignupData(
      u_id: map['u_id'] ?? '',
      dob: map['dob'] ?? '',
      c_id: map['c_id'] ?? '',
      b_id: map['b_id'] ?? '',
      address: map['address'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
  
  factory SignupData.fromController(SignUpController controller) {
    String u_id = controller.uidController.text;
    String dob = controller.selectedDob;
    String c_id = controller.selectedCollegeId!;
    String b_id = controller.selectedBatchId!;
    String address = controller.addressController.text;
    String name = controller.nameController.text;
    String phone = controller.phoneController.text;
    String email = controller.emailController.text;
    String password = controller.passwordController.text;

    return SignupData(
      u_id: u_id,
      dob: dob,
      c_id: c_id,
      b_id: b_id,
      address: address,
      name:name,
      phone: phone,
      email: email,
      password: password,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupData.fromJson(String source) => SignupData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignupData(u_id: $u_id, dob: $dob, c_id: $c_id, b_id: $b_id, address: $address, name: $name, phone: $phone, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SignupData &&
      other.u_id == u_id &&
      other.dob == dob &&
      other.c_id == c_id &&
      other.b_id == b_id &&
      other.address == address &&
      other.name == name &&
      other.phone == phone &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return u_id.hashCode ^
      dob.hashCode ^
      c_id.hashCode ^
      b_id.hashCode ^
      address.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}