class UserEditFormModels {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  UserEditFormModels({
    this.username,
    this.name,
    this.email,
    this.password,
  });

  //Function to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
