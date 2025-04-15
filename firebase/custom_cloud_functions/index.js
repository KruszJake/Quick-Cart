const admin = require("firebase-admin/app");
admin.initializeApp();

const addIngredients = require("./add_ingredients.js");
exports.addIngredients = addIngredients.addIngredients;
