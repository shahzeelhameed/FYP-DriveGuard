const express = require('express');
const mongoose = require('mongoose');
const app = express();

// routes
const authRoutes = require('./routes/authroutes');
const userRoutes = require('./routes/userRoutes');
const productRoutes = require('./routes/productRoutes');

const FavRoutes = require('./routes/FavRoutes');

// const categoryRoute = require('./routes/preferenceRoute');
const preferenceRoute = require('./routes/preferenceRoute');
const orderRoutes = require('./routes/orderRoutes');
const carRoutes = require('./routes/Car/carRoutes');

app.use(express.json());

app.use('/', authRoutes);

app.use('/', userRoutes);

app.use('/', productRoutes);

app.use('/', FavRoutes);

app.use('/', preferenceRoute);

app.use('/', orderRoutes);

app.use('/', carRoutes);
// app.use('/', preferenceRoute);

// app.post('/api/tv', async (req, res) => {
//   try {
//     const tv = new Tv(req.body);

//     await tv.save();
//     res.status(200).json({ messgae: 'Product created Successfully' });
//   } catch (error) {
//     res.status(501).json({ message: error.message });
//   }
// });

mongoose
  .connect(
    'mongodb://shahzeel:shahzeel1@ac-npmzddl-shard-00-00.mmxllm4.mongodb.net:27017,ac-npmzddl-shard-00-01.mmxllm4.mongodb.net:27017,ac-npmzddl-shard-00-02.mmxllm4.mongodb.net:27017/?ssl=true&replicaSet=atlas-m95yd5-shard-0&authSource=admin&retryWrites=true&w=majority&appName=Backend'
  )
  .then(() => {
    console.log('Conneted to Database');
    app.listen(3000, () => {
      console.log('Server is running on 3000');
    });
  })
  .catch((e) => {
    console.log('Connection Failed');
  });
