class AlbumResponseModel {
  int? userId;
  int? id;
  String? title;

  AlbumResponseModel({this.userId, this.id, this.title});

  AlbumResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
