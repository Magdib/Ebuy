class CommentModel {
  String? commentId;
  String? commentUsersid;
  String? commentItemsid;
  String? commentRate;
  String? commentBody;
  String? commentDatetime;
  String? itemsId;
  String? usersId;
  String? usersName;
  String? usersImage;

  CommentModel(
      {this.commentId,
      this.commentUsersid,
      this.commentItemsid,
      this.commentRate,
      this.commentBody,
      this.commentDatetime,
      this.itemsId,
      this.usersId,
      this.usersName,
      this.usersImage});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    commentUsersid = json['comment_usersid'];
    commentItemsid = json['comment_itemsid'];
    commentRate = json['comment_rate'];
    commentBody = json['comment_body'];
    commentDatetime = json['comment_datetime'];
    itemsId = json['items_id'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersImage = json['users_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['comment_usersid'] = this.commentUsersid;
    data['comment_itemsid'] = this.commentItemsid;
    data['comment_rate'] = this.commentRate;
    data['comment_body'] = this.commentBody;
    data['comment_datetime'] = this.commentDatetime;
    data['items_id'] = this.itemsId;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_image'] = this.usersImage;
    return data;
  }
}
