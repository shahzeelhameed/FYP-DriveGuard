// class Car {
//   Car({required this.name, required this.models});

//   String name;
//   List<String> models;
// }

// List<Car> carsData = [
//   Car(name: "Toyota Corolla", models: ['GLI', 'XLI']),
//   Car(name: "Audi", models: ['E Tron', 'GT']),
// ];

import 'package:bro/data/productdata.dart';

class Car {
  String car_id;
  String car_name;
  String brand;
  dynamic models;
  Car(
      {required this.car_id,
      required this.car_name,
      required this.brand,
      required this.models});
}

final List<Car> carsData = [];


// final List<Car> carsData = [
//   Car(name: "Toyota Corolla", models: [
//     {
//       'name': 'GLI',
//       'products': [
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//       ]
//     },
//     {
//       'name': 'XLI',
//       'products': [
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//       ]
//     },
//   ]),
//   Car(name: "Suzuki Alto", models: [
//     {
//       'name': 'VXR',
//       'products': [
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//       ]
//     },
//     {
//       'name': 'VXL',
//       'products': [
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//         CarProduct(
//             product_id: '0001',
//             product_name: "Suzuki Oil Filter",
//             price: 200,
//             description: "ijoqidowqd",
//             category: 'Oil Filter',
//             imgUrl: "lib/assets/images/Product 5.png"),
//       ]
//     },
//   ]),
  // Car(name: "Suzuki Mehran", models: [
  //   {
  //     'name': 'VXR',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //     ]
  //   },
  //   {
  //     'name': 'VX',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //     ]
  //   },
  // ]),
  // Car(name: "Nissan Dayz", models: [
  //   {
  //     'name': 'Bolero J',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //     ]
  //   },
  //   {
  //     'name': 'Highway Star',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //     ]
  //   },
  // ]),
  // Car(name: "Toyota Passo", models: [
  //   {
  //     'name': 'Moda',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //     ]
  //   },
  //   {
  //     'name': 'Passo X',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //     ]
  //   },
  // ]),
  // Car(name: "Suzuki Cultus", models: [
  //   {
  //     'name': 'Euro II',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //       CarProduct(
  //           name: "Helix",
  //           price: 2000,
  //           title: 'Shell',
  //           imagePath: "lib/assets/images/Product 4.png",
  //           description: "Helix is the most reliable"),
  //     ]
  //   },
  //   {
  //     'name': 'Limited Edition',
  //     'products': [
  //       CarProduct(
  //           name: "Quartz ",
  //           price: 2300,
  //           title: 'Total',
  //           imagePath: "lib/assets/images/Product 2.png",
  //           description: "Quartz is the best oil company"),
  //     ]
  //   },
  // ]),
// ];
