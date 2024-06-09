const express = require('express');
const router = express.Router();
const userControllers = require('../controller/userControllers');

router.get(
  '/api/userData',
  userControllers.verifyToken,
  userControllers.getUserData
);

router.put('/api/updateUserInfo/:id', userControllers.updateUserInfo);

router.delete('/api/deleteUser/:user_id', userControllers.deleteUser);

router.put('/api/changePassword/:user_id', userControllers.changePassword);

module.exports = router;
