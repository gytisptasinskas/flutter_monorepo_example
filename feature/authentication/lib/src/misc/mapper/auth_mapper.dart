import 'package:authentication/src/misc/network/response/user_response.dart';
import 'package:domain/domain.dart';

class AuthMapper {
  User getUserFromResponse(UserResponse response) =>
      User(name: response.name, id: response.id, email: response.email);
}
