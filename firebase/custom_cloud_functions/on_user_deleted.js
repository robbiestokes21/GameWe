const admin = require("firebase-admin");
const functions = require("firebase-functions");

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  const firestore = admin.firestore();
  const userRef = firestore.doc("users/" + user.uid);

  try {
    await userRef.delete();
    console.log(`Successfully deleted user data for user: ${user.uid}`);
  } catch (error) {
    console.error(`Error deleting user data for user: ${user.uid}`, error);
  }
});
