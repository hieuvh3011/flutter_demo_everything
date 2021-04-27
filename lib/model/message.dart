class Message {
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime createAt;
  final DateTime updatedAt;

  Message({
    this.senderId,
    this.receiverId,
    this.content,
    this.createAt,
    this.updatedAt,
  });
}
