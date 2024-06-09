const moongose = require('mongoose');

const orderProductSchema = moongose.Schema({
  product_id: {
    type: moongose.Schema.Types.ObjectId,
    ref: 'Product',
    required: true,
  },

  quantity: {
    type: Number,
    required: true,
  },
});
const orderSchema = moongose.Schema({
  order_products: {
    type: [orderProductSchema],

    required: true,

    validate: {
      validator: function (value) {
        return value.length > 0;
      },
      message: 'The order must contain at least one product.',
    },
  },

  user_id: {
    type: moongose.Schema.Types.ObjectId,
    ref: 'User',
    required: true,
  },

  total_price: {
    type: Number,
  },

  payment_method: {
    type: String,
    enum: ['Cash on Delivery', 'Card'],
  },
});

const Order = moongose.model('Order', orderSchema);

module.exports = Order;
