import 'package:flutter/material.dart';
import 'package:mbo/components/widgets/misc/mbo_message.dart';

class MessageService {
  const MessageService();

  MboMessageState get messageState => MboMessage.globalKey.currentState!;

  /// Show a global [SnackBar] using the [MboMessage].
  void show(String message, [SnackBarAction? action]) =>
      messageState.show(message);

  /// Show a global custom [SnackBar] using [MboMessage].
  void showCustom(SnackBar snackBar) => messageState.showCustom(snackBar);
}
