class RegisterModel
{
  final String name;
  final String email;
  final String password;
  final String gender;
  final String nationality;
  final String status;
  final String birthday;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'nationality': nationality,
      'status': status,
      'birthday': birthday,
    };
  }

  // factory RegisterModel.fromMap(Map<String, dynamic> map) {
  //   return RegisterModel(
  //     name: map['name'] as String,
  //     email: map['email'] as String,
  //     password: map['password'] as String,
  //     gender: map['gender'] as String,
  //     nationality: map['nationality'] as String,
  //     status: map['status'] as String,
  //     birthday: map['birthday'] as String,
  //   );
  // }

  const RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.nationality,
    required this.status,
    required this.birthday,
  });
}