const functions = require("firebase-functions");
const axios = require("axios");
const url = require("url");
exports.exchangeAuthCode = functions.https.onRequest(async (req, res) => {
  const code = req.query.code;
  const currentUrl = url.format({
    protocol: req.protocol,
    host: req.get("host"),
    pathname: req.originalUrl + "/authcallback",
  });
  const redirectUri = currentUrl;
  const clientId = "98630727b7b84746add335d281f0a31f";
  const clientSecret = "tHiQLEFn4mUnuY67qxoU4pfgUeGLcVnF";

  if (!code) {
    return res.status(400).send("Authorization code is missing");
  }

  try {
    const response = await axios.post("https://oauth.battle.net/token", null, {
      params: {
        redirect_uri: redirectUri,
        grant_type: "authorization_code",
        code: code,
      },
      auth: {
        username: clientId,
        password: clientSecret,
      },
    });

    const accessToken = response.data.access_token;
    return accessToken;
    //res.json({ access_token: accessToken });
  } catch (error) {
    console.error("Error exchanging authorization code:", error);
    res.status(500).send("Error exchanging authorization code");
  }
});
