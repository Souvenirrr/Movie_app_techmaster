class LoginModel {
  String responseTime;
  int code;
  String message;
  Data data;

  LoginModel({this.responseTime, this.code, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    responseTime = json['responseTime'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseTime'] = this.responseTime;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int userType;
  UserProfile userProfile;
  String token;

  Data({this.userType, this.userProfile, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    userProfile = json['userProfile'] != null
        ? new UserProfile.fromJson(json['userProfile'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    if (this.userProfile != null) {
      data['userProfile'] = this.userProfile.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class UserProfile {
  String id;
  String name;
  String phone;
  String password;
  Null avatar;
  int role;
  Null address;

  UserProfile(
      {this.id,
        this.name,
        this.phone,
        this.password,
        this.avatar,
        this.role,
        this.address});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    avatar = json['avatar'];
    role = json['role'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    data['address'] = this.address;
    return data;
  }
}
