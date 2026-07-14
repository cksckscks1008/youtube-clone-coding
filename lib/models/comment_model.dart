class CommentModel {
  final String commentId;
  final String commentContext;
  final int afterMinute;
  bool isLiked;
  bool isDisliked;
  int totalLiked;

  CommentModel({
    required this.commentId,
    required this.commentContext,
    required this.afterMinute,
    this.isLiked = false,
    this.isDisliked = false,
    this.totalLiked = 0
  });
}