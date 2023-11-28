class SignInFormModel {
  final String? email;
  final String? password;

  //constructor
  SignInFormModel({
    this.email,
    this.password,
  });

  //Funtion toJson
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
