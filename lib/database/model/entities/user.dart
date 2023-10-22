class User {
  static const dbTableName = 'Users';

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String password;

 // final bool isEmailConfirmed;

  static const String createTable = '''CREATE TABLE IF NOT EXISTS $dbTableName(
        user_id INT PRIMARY KEY, 
        first_name TEXT NOT NULL, 
        last_name TEXT NOT NULL, 
        email TEXT NOT NULL,
        address TEXT NOT NULL,
        password TEXT NOT NULL
        )
        ''';

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.password,
      });

  static User? fromMap(Map<String, dynamic> map) {
    int id = map['user_id'] as int? ?? 0;
    String firstName = map['first_name'] as String? ?? '';
    String lastName = map['last_name'] as String? ?? '';
    String address = map['address'] as String? ?? '';
    String email = map['email'] as String? ?? '';
      String password = map['password'] as String? ?? '';

   // bool isEmailConfirmed = map['IsEmailConfirmed'] as bool? ?? false;

    if (id == 0 ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        address.isEmpty ||
        email.isEmpty ||
        password.isEmpty
) {
      return null;
    }

    return User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        address: address,
        password: password,

        );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'password': password,
    
    };
  }

  User.fromJson(Map<dynamic, dynamic> json)
      : id = json['user_id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        email = json['email'],
        address= json['address'],
        password = json['password'];

}
