import 'dart:convert';

class Post {
  int? userid;
  int? id;
  String? title;
  String? body;
  Post({
    this.userid,
    this.id,
    this.title,
    this.body,
  });

  Post copyWith({
    int? userid,
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      userid: userid ?? this.userid,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userid: map['userid'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(userid: $userid, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.userid == userid &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userid.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
