import 'package:fluttertdd/domain/entities/account_entitiy.dart';

class RemoteAccountModel {
  final String acessToken;

  RemoteAccountModel(this.acessToken);

  factory RemoteAccountModel.fromJson(Map json) =>
      RemoteAccountModel(json['acessToken']);

  AccountEntity toEntity() => AccountEntity(acessToken);
}
