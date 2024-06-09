const mongoose = require('mongoose');

// Priority Schema
const prioritySchema = new mongoose.Schema(
  {
    first_priority: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Product',
    },
    second_priority: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Product',
    },
    third_priority: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Product',
    },
  },
  { _id: false }
);

// Preferred Products Schema
const preferredProductsSchema = new mongoose.Schema({
  car_id: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Car',
    required: true, // Ensure this field is always provided
  },

  model_id: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Car',
    required: true,
  },
  modelProducts: {
    Oil_Filter: prioritySchema,
    Air_Filter: prioritySchema,
    Car_Oil: prioritySchema,
  },
});

// Create and export the PreferredProduct model
const PreferredProduct = mongoose.model(
  'PreferredProduct',
  preferredProductsSchema
);

module.exports = PreferredProduct;
