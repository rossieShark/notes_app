import 'package:logging/logging.dart';

Logger getLogger(String name) {
  return Logger.detached(name);
}

void setLogLevel(Level level) {
  Logger.root.level = level;
}
