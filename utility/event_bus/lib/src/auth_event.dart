sealed class AuthEvent {
  const AuthEvent();

  factory AuthEvent.loggedIn() = UserLoggedIn;
}

class UserLoggedIn extends AuthEvent {
  const UserLoggedIn();
}
