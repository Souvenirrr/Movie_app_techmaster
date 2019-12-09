class SeatModel {
  String status;
  String msg;
  List<Data> data;

  SeatModel({this.status, this.msg, this.data});

  SeatModel.fromJson(Map<String, dynamic> json) {
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
  String row;
  List<Seats> seats;

  Data({this.row, this.seats});

  Data.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    if (json['seats'] != null) {
      seats = new List<Seats>();
      json['seats'].forEach((v) {
        seats.add(new Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seats {
  int seatId;
  String seatType;
  int number;
  dynamic seatStatus;

  Seats({this.seatId, this.seatType, this.number, this.seatStatus});

  Seats.fromJson(Map<String, dynamic> json) {
    seatId = json['seat_id'];
    seatType = json['seat_type'];
    number = json['number'];
    seatStatus = json['seat_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seat_id'] = this.seatId;
    data['seat_type'] = this.seatType;
    data['number'] = this.number;
    data['seat_status'] = this.seatStatus;
    return data;
  }
}
