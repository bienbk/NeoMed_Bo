// ignore_for_file: avoid_print

import 'package:logging/logging.dart';

mixin MboLogger {
  Logger get log => Logger('$runtimeType');
}

void initializeLogger({String? prefix}) {
  Logger.root.level = Level.ALL;

  const separator = ' | ';
  const horizontalSeparator = '--------------------------------';

  Logger.root.onRecord.listen((rec) {
    final content = [
      if (prefix != null) ...[
        prefix,
        separator,
      ],
      rec.level.name.padRight(7),
      separator,
      rec.loggerName.padRight(22),
      separator,
      rec.message,
    ];

    print(content.join());

    if (rec.error != null) {
      print(horizontalSeparator);
      print('ERROR');

      print(rec.error.toString());

      print(horizontalSeparator);

      if (rec.stackTrace != null) {
        print('STACK TRACE');
        rec.stackTrace.toString().trim().split('\n').forEach(print);
        print(horizontalSeparator);
      }
    }
  });
}
