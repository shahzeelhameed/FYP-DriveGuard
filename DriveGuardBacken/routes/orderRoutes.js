const express = require('express');
const router = express.Router();
const OrderController = require('../controller/orderController');

router.post('/api/create-order', OrderController.addOrder);

module.exports = router;
