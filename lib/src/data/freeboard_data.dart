class FreeBoardData {
  String content;
  String username;
  DateTime writeTime;
  bool isDelete;
  List<FreeBoardComment> comments;
  List<String> likes;

  FreeBoardData({
    required this.content,
    required this.username,
    required this.writeTime,
    this.isDelete = false,
    required this.comments,
    required this.likes,
  });

  factory FreeBoardData.fromJson(Map<String, dynamic> json) {
    var list = json['comments'] as List;
    List<FreeBoardComment> commentsList =
        list.map((i) => FreeBoardComment.fromJson(i)).toList();

    var likesFromJson = json['likes'];
    List<String> likesList = likesFromJson.cast<String>();

    return FreeBoardData(
      content: json['content'],
      username: json['username'],
      writeTime: json['writeTime'],
      comments: commentsList,
      likes: likesList,
    );
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'username': username,
        'writeTime': writeTime,
        'isDelete': isDelete,
        'comments': List<dynamic>.from(comments.map((e) => e.toJson())),
        'likes': List<dynamic>.from(likes.map((e) => e))
      };
}

class FreeBoardComment {
  String commentContent;
  String commentUsername;
  DateTime commentWriteTime;
  bool commentIsDelete;

  FreeBoardComment({
    required this.commentContent,
    required this.commentUsername,
    required this.commentWriteTime,
    this.commentIsDelete = false,
  });

  factory FreeBoardComment.fromJson(Map<String, dynamic> json) {
    return FreeBoardComment(
        commentContent: json['commentContent'],
        commentUsername: json['commentUsername'],
        commentWriteTime: json['commentWriteTime']);
  }

  Map<String, dynamic> toJson() => {
        'commentContent': commentContent,
        'commentUsername': commentUsername,
        'commentWriteTime': commentWriteTime,
        'commentIsDelete': commentIsDelete,
      };
}
