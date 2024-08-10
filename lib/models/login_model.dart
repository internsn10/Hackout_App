class login_model {
  String? status;
  String? message;

  login_model({this.status, this.message});

  login_model.fromJSON();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
