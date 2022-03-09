import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'agora_token_request.dart';

part 'agora_token_api_client.g.dart';

@injectable
@RestApi(baseUrl: '')
abstract class AgoraTokenApiClient {
  @factoryMethod
  factory AgoraTokenApiClient(Dio dio) = _AgoraTokenApiClient;

  @POST('/GetAgoraToken')
  Future<String> getAgoraToken(@Body() AgoraTokenRequest request);
}
