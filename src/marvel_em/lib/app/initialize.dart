import 'injector.dart' as di;

class Initialize {
  static Future<void> init() async {
    await di.init();
  }
}
