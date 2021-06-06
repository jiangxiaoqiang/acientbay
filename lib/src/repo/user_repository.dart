import 'package:acientbay/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  late User _user;

  Future<User> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = User(const Uuid().v4()),
    );
  }
}