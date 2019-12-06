class Schedule {
  String status;
  String msg;
  List<Data> data;

  Schedule({this.status, this.msg, this.data});

  Schedule.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int cinemaId;
  String cinemaName;
  List<CinemaData> cinemaData;

  Data({this.cinemaId, this.cinemaName, this.cinemaData});

  Data.fromJson(Map<String, dynamic> json) {
    cinemaId = json['cinema_id'];
    cinemaName = json['cinema_name'];
    if (json['cinema_data'] != null) {
      cinemaData = new List<CinemaData>();
      json['cinema_data'].forEach((v) {
        cinemaData.add(new CinemaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cinema_id'] = this.cinemaId;
    data['cinema_name'] = this.cinemaName;
    if (this.cinemaData != null) {
      data['cinema_data'] = this.cinemaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CinemaData {
  int scheduleId;
  String scheduleStart;
  String seatEmpty;

  CinemaData({this.scheduleId, this.scheduleStart, this.seatEmpty});

  CinemaData.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    scheduleStart = json['schedule_start'];
    seatEmpty = json['seat_empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this.scheduleId;
    data['schedule_start'] = this.scheduleStart;
    data['seat_empty'] = this.seatEmpty;
    return data;
  }
}
