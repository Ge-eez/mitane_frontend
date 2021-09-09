import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
import 'package:mitane_frontend/infrastructure/auth/data_provider/auth_provider.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  Future<User> signIn(Login login) async {
    print(login.phone);
    return await authDataProvider.loginUser(login);
  }

  Future<bool> signUp(Register register) async {
    return authDataProvider.registerUser(register);
  }
}