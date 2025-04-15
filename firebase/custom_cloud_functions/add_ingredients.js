const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const { onCall } = require("firebase-functions/v2/https");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");
const admin = require("firebase-admin");

admin.initializeApp(); // Needed unless you're using AppCheck or explicitly managing multiple apps

// Callable function to split ingredients and add to Firestore
exports.addIngredients = onCall(async (request) => {
  const ingredientsString = request.data.ingredientsString;
  const userId = request.data.userId || null;

  if (!ingredientsString) {
    throw new Error("No ingredients string provided");
  }

  const ingredients = ingredientsString.split(",").map((i) => i.trim());
  const db = getFirestore();
  const batch = db.batch();

  ingredients.forEach((ingredient) => {
    const docRef = db.collection("grocery_items").doc();
    batch.set(docRef, {
      name: ingredient,
      user_id: userId,
      timestamp: FieldValue.serverTimestamp(),
    });
  });

  await batch.commit();

  return {
    success: true,
    added: ingredients.length,
  };
});
