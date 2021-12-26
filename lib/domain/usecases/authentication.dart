import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth(
      {@required String email,
      @required String password}); // ele vai retornar um token(account entity)
}
