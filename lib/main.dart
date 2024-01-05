import 'package:notes_app/ui/screens/main_app/main_app_builder.dart';
import 'package:notes_app/ui/screens/main_app/main_app_runner.dart';

void main() async {
  const env = String.fromEnvironment('env', defaultValue: 'dev');
  const runner = MainAppRunner(env);
  final builder = MainAppBuilder();
  runner.run(builder);
}
