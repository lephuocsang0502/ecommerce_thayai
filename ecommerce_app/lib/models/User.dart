class User {
  String firstName;
  String lastName;
  String email;
  String role;
  String fullName;

  User({this.firstName, this.lastName, this.email, this.role, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['fullName'] = this.fullName;
    return data;
  }
}
