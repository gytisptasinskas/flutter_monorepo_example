import 'package:dependency_injection/dependency_injection.dart';
import 'package:event_bus/event_bus.dart' as event_bus;
import 'package:event_bus/event_bus.dart';
import 'package:mobx/mobx.dart';
import 'package:storage/storage.dart';

part 'application_store.g.dart';

class ApplicationStore = _ApplicationStore with _$ApplicationStore;

abstract class _ApplicationStore with Store {
  final GeneralStorage _storage = locator<GeneralStorage>();

  @readonly
  bool _isAuthenticated = false;

  @readonly
  bool _isInitialized = false;

  @action
  Future<void> initialize() async {
    _isAuthenticated = await _storage.getUserLoginStatus();

    event_bus.on<UserLoggedIn>().listen((_) {
      _isAuthenticated = true;
    });

    _isInitialized = true;
  }
}
