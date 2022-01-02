import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fluttertdd/domain/helpers/helpers.dart';
import 'package:fluttertdd/domain/usecases/authentication.dart';

import 'package:fluttertdd/data/http/http.dart';
import 'package:fluttertdd/data/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClient httpClient;
  String url;
  AuthenticationParams params;
  Map mockValidData() =>
      {'acessToken': faker.guid.guid(), 'name': faker.person.name()};

  PostExpectation mockRequest() => when(httpClient.request(
      url: anyNamed('url'),
      method: anyNamed('method'),
      body: anyNamed('body')));

  void mockHttpData(Map data) {
    mockRequest().thenAnswer((_) async => data); //
  } //sucesso

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url); //arrange
    params = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());
    mockHttpData(mockValidData());
  });
  test('Should call HttpClient with corret values', () async {
    await sut.auth(params); //action

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.password}));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    mockHttpError(HttpError.badRequest);
    final future = sut.auth(params); //action

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    mockHttpError(HttpError.notFound);
    final future = sut.auth(params); //action

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockHttpError(HttpError.serverError);
    final future = sut.auth(params); //action

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 401',
      () async {
    mockHttpError(HttpError.unauthorized);
    final future = sut.auth(params); //action

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an Account if HttpClient returns 200', () async {
    final validData = mockValidData();
    mockHttpData(validData);

    final account = await sut.auth(params); //action

    expect(account.token, validData['acessToken']);
  });

  test(
      'Should should throws an UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    mockHttpData({
      'invalid_key': 'invalid_value',
    }); //o guid simula o token
    final future = sut.auth(params); //action

    expect(future, throwsA(DomainError.unexpected));
  });
}
