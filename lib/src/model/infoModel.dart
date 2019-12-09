class InfoModel {
  String status;
  String msg;
  Data data;

  InfoModel({this.status, this.msg, this.data});

  InfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int userId;
  String username;
  String password;
  String userAvatar;
  String userFullname;
  String userBirthday;
  int userGender;
  String userEmail;
  String userPhone;
  String userCity;

  Data(
      {this.userId,
        this.username,
        this.password,
        this.userAvatar,
        this.userFullname,
        this.userBirthday,
        this.userGender,
        this.userEmail,
        this.userPhone,
        this.userCity});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    password = json['password'];
    userAvatar = json['userAvatar'];
    userFullname = json['userFullname'];
    userBirthday = json['userBirthday'];
    userGender = json['userGender'];
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    userCity = json['userCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['password'] = this.password;
    data['userAvatar'] = this.userAvatar;
    data['userFullname'] = this.userFullname;
    data['userBirthday'] = this.userBirthday;
    data['userGender'] = this.userGender;
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['userCity'] = this.userCity;
    return data;
  }
}
