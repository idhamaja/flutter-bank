class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final int? balance;
  final String? cardNumber;
  final String? pinNumber;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.username,
    this.verified,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.pinNumber,
    this.token,
  });

  //constructor UserModel fromJSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pinNumber: json['pin'],
        token: json['token'],
      );

  //function copyWith
  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        pinNumber: pinNumber ?? this.pinNumber,
        password: password ?? this.password,
        balance: balance ?? this.balance,
        verified: verified,
        profilePicture: profilePicture,
        cardNumber: cardNumber,
        token: token,
      );
}

// {
//     "id": 1459,
//     "name": "Idham Ganteng",
//     "email": "idham16ip@gmail.com",
//     "username": "idham16ip@gmail.com",
//     "email_verified_at": null,
//     "verified": 1,
//     "profile_picture": "https://bwabank.my.id/storage/L6FQ4bWA4z.png",
//     "ktp": "https://bwabank.my.id/storage/7OShH4N2hz.png",
//     "created_at": "2023-11-28 11:11:21",
//     "updated_at": "2023-11-28 11:11:21",
//     "balance": 0,
//     "card_number": "4668475854161391",
//     "pin": "123456",
//     "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYndhYmFuay5teS5pZFwvYXBpXC9yZWdpc3RlciIsImlhdCI6MTcwMTE3Mjc2MSwiZXhwIjoxNzAxMTc2MzYxLCJuYmYiOjE3MDExNzI3NjEsImp0aSI6ImNMd29VRXpVZlg3MmxERGgiLCJzdWIiOjE0NTksInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.7c8sBpEsx58lVpcI24VSLD6yxfqPRqJC8rKSiC9WE0Y",
//     "token_expires_in": 3600,
//     "token_type": "bearer"
// }