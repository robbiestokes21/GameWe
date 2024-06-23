const admin = require("firebase-admin/app");
admin.initializeApp();

const onUserDeleted = require("./on_user_deleted.js");
exports.onUserDeleted = onUserDeleted.onUserDeleted;
const exchangeAuthCode = require("./exchange_auth_code.js");
exports.exchangeAuthCode = exchangeAuthCode.exchangeAuthCode;
