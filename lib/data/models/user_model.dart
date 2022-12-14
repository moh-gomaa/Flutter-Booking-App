class UserModel {
  UserModel({
    int? id,
    String? name,
    String? email,
    String? apiToken,
    String? image,
    String? password,
    String? passwordConfirmation,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _apiToken = apiToken;
    _image = image;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _apiToken = json['api_token'];
    _image = json['image'];
  }

  int? _id;
  String? _name;
  String? _email;
  String? _apiToken;
  String? _image;
  String? _password;
  String? _passwordConfirmation;

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? apiToken,
    String? image,
  }) =>
      UserModel(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        apiToken: apiToken ?? _apiToken,
        image: image ?? _image,
      );

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get name => _name;

  set name(String? name) => _name = name;

  String? get email => _email;

  set email(String? email) => _email = email;

  String? get apiToken => _apiToken;

  set apiToken(String? apiToken) => _apiToken = apiToken;

  String? get image => _image;

  set image(String? image) => _image = image;

  String? get password => _password;

  set password(String? password) => _password = password;

  String? get passwordConfirmation => _passwordConfirmation;

  set passwordConfirmation(String? passwordConfirmation) =>
      _passwordConfirmation = passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

  Map<String, dynamic> toJsonDB() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['api_token'] = _apiToken;
    map['image'] = _image;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }
}
