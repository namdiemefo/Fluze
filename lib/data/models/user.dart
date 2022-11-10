/// name : ""
/// email : ""

class User {
  String? _name;
  String? _email;

  String? get name => _name;
  String? get email => _email;

  User({
      String? name,
      String? email}){
    _name = name;
    _email = email;
}

  User.fromJson(dynamic json) {
    _name = json["name"];
    _email = json["email"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    return map;
  }

}