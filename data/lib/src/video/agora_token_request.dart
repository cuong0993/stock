import 'package:freezed_annotation/freezed_annotation.dart';

part 'agora_token_request.freezed.dart';
part 'agora_token_request.g.dart';

@freezed
class AgoraTokenRequest with _$AgoraTokenRequest {
  factory AgoraTokenRequest({
    required String channelName,
    required String account,
  }) = _AgoraTokenRequest;

  factory AgoraTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$AgoraTokenRequestFromJson(json);
}
