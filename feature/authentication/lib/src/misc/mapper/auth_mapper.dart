import 'package:authentication/src/misc/entity/user.dart';
import 'package:authentication/src/misc/network/response/user_response.dart';

class AuthMapper {
  User getUserFromResponse(UserResponse response) => User(name: response.name);
}
