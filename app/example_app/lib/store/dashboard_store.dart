import 'dart:async';

import 'package:dependency_injection/dependency_injection.dart';
import 'package:domain/domain.dart';
import 'package:mobx/mobx.dart';
import 'package:user_state/user_state.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  final CurrentUserState _userState = locator<CurrentUserState>();

  @readonly
  User? _currentUser;

  StreamSubscription<User?>? _userSubscription;

  @action
  Future<void> load() async {
    _userSubscription = _userState.userStream.listen((user) {
      _currentUser = user;
    });
  }

  @action
  Future<void> dispose() async {
    await _userSubscription?.cancel();
  }
}
