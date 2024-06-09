// const express = require('express');
const express = require('express');
const router = express.Router();
const preferenceController = require('../controller/preferenceController');

router.post('/api/addPreferedProduct', preferenceController.addPreferedProduct);
router.get(
  '/api/get_model_preferences/:car_id/:model_id',
  preferenceController.getpreferedProducts
);

// preferenceRoute.post(
//   '/api/getAllpreferences',
//   preferenceController.getAllFromPreferene
// );

module.exports = router;
