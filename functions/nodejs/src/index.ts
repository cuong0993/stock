import {HttpFunction} from '@google-cloud/functions-framework/build/src/functions';
import {RtcRole, RtcTokenBuilder} from 'agora-access-token';

export const GetAgoraToken: HttpFunction = (req, res) => {
  const agoraAppId = process.env.ENV_AGORA_APP_ID!;
  const agoraAppCertificate = process.env.AGORA_PRIMARY_CERTIFICATE!;
  const channelName = req.body.channelName;
  const account = req.body.account;
  const role = RtcRole.PUBLISHER;
  console.log(channelName);
  console.log(account);

  const expirationTimeInSeconds = 3600;

  const currentTimestamp = Math.floor(Date.now() / 1000);

  const privilegeExpiredTs = currentTimestamp + expirationTimeInSeconds;
  const token = RtcTokenBuilder.buildTokenWithAccount(
    agoraAppId,
    agoraAppCertificate,
    channelName,
    account,
    role,
    privilegeExpiredTs
  );
  res.send(token);
};

declare let process: {env: {[key: string]: string}};
