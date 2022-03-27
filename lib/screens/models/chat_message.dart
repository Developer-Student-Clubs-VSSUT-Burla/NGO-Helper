import 'chat_user.dart';

class Message {
  final User? sender;
  final String? text;
  final String? time;

  Message({
    this.sender,
    this.text,
    this.time,
  });
}
