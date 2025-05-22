import '../models/user_model.dart';

class AuthController {
  UserModel? currentUser;

  bool login(String username, String password) {
    // Simulación simple de login
    if (username == 'admin' && password == '1234') {
      currentUser = UserModel(
        username: 'admin',
        password: '1234',
        firstName: 'Admin',
        lastName: 'User',
        city: 'Ciudad',
        province: 'Provincia',
        address: 'Calle 123',
        email: 'admin@mail.com',
        phone: '123456789',
        postalCode: '1000',
      );
      return true;
    }
    return false;
  }

  void register(UserModel user) {
    currentUser = user;
  }
}
