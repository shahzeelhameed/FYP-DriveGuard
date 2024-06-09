const PreferredProduct = require('../model/Car/preferedProducts');

exports.addPreferedProduct = async (req, res) => {
  try {
    const { car_id, model_id } = req.body;

    // Check if the car_id already has any preferred product
    const foundCar = await PreferredProduct.findOne({ car_id: car_id });

    if (!foundCar) {
      // If no preferred product exists for the car_id, create a new one
      const preferredProduct = new PreferredProduct(req.body);
      await preferredProduct.save();
      return res
        .status(200)
        .json({ message: 'PreferredProduct Created Successfully' });
    } else {
      // If a preferred product exists for the car_id, check if the model_id is already associated with it
      const foundCombination = await PreferredProduct.findOne({
        car_id: car_id,
        model_id: model_id,
      });

      if (!foundCombination) {
        // If the model_id is not associated with the car_id, create a new preferred product
        const preferredProduct = new PreferredProduct(req.body);
        await preferredProduct.save();
        return res
          .status(200)
          .json({ message: 'PreferredProduct Created Successfully' });
      } else {
        // If the model_id is already associated with the car_id, return an error message
        return res
          .status(400)
          .json({ message: 'Car id and model id combination already exists' });
      }
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getpreferedProducts = async (req, res) => {
  try {
    const { car_id, model_id } = req.params;

    const preferredProducts = await PreferredProduct.find({
      car_id,
      model_id,
    })
      .populate({
        path: 'modelProducts.Oil_Filter.first_priority modelProducts.Oil_Filter.second_priority modelProducts.Oil_Filter.third_priority',
        model: 'Product',
      })
      .populate({
        path: 'modelProducts.Air_Filter.first_priority modelProducts.Air_Filter.second_priority modelProducts.Air_Filter.third_priority',
        model: 'Product',
      })
      .populate({
        path: 'modelProducts.Car_Oil.first_priority modelProducts.Car_Oil.second_priority modelProducts.Car_Oil.third_priority',
        model: 'Product',
      });

    res.status(200).json(preferredProducts);
  } catch (error) {
    res
      .status(500)
      .json({ message: 'Some Error Occurred', error: error.message });
  }
};
