import 'package:authentication/src/misc/network/response/user_response.dart';

class AuthService {
  Future<UserResponse> login() async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    final result = UserResponse(
      id: '123',
      name: 'John Doe',
      email: 'john.doe@example.com',
    );
    return result;
  }
}
