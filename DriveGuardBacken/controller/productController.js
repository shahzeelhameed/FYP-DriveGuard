const Product = require('../model/product.model');

exports.addProduct = async (req, res) => {
  try {
    const product = new Product(req.body);

    if (!product) {
      res
        .status(404)
        .json({ messgae: 'Product didnot created , Some Error occur' });
    }

    await product.save();
    res.status(200).json({ messgae: 'Product created Successfully' });
  } catch (error) {
    res.status(501).json({ message: error.message });
  }
};

exports.getProducts = async (req, res) => {
  try {
    const products = await Product.find({}).populate({
      path: 'Reviews_Rating.user_id',
      model: 'User',
      select: 'username',
    });
    if (!products) {
      res.status(404).json({ message: 'Product not Found' });
    }

    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.addReview = async (req, res) => {
  const { product_id } = req.params;
  try {
    const updatedProduct = await Product.findByIdAndUpdate(
      product_id,
      { $push: { Reviews_Rating: req.body } }, // Use $push to add the review to the array
      { runValidators: true } // Ensure validators run and return the updated document
    );

    if (!updatedProduct) {
      return res.status(404).json({ message: 'Product not found' });
    }

    res.status(200).json({ message: 'Your review has been added' });
  } catch (error) {
    res.status(500).json({
      message: 'Error adding review',
      error: error.message,
    });
  }
};

// exports.category = async (req, res) => {
//   try {
//     const { category } = req.params;

//     // console.log(category);

//     const categoryProducts = await Product.find({ category: category });

//     console.log(categoryProducts);

//     if (!categoryProducts) {
//       res
//         .status(400)
//         .json({ message: 'There is no product in the Collection' });
//     }

//     res.status(200).json(categoryProducts);
//   } catch (error) {
//     res.status(500).json({ message: error.message });
//   }
// };
