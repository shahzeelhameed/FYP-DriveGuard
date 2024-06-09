const Order = require('../model/OrderModel');
const User = require('../model/usermodel');

exports.addOrder = async (req, res) => {
  const { order_products, user_id, total_price, payment_method } = req.body;
  try {
    const user = await User.findById(user_id);

    if (user.address === null) {
      return res.status(401).json({ message: 'Address not uploaded' });
    }

    const order = new Order({
      order_products: order_products,
      user_id: user_id,
      total_price: total_price,
      payment_method: payment_method,
    });

    await order.save();

    return res.status(200).json({ message: 'Order Created Successfuly ' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
