import 'dart:convert';

import 'package:bro/data/productdata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ModelPreferencesProvider extends StateNotifier<List<dynamic>> {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<CarProduct> _listOfOilFilters = [];
  List<CarProduct> _listofAirFilters = [];
  List<CarProduct> _listofCarOil = [];

  List<CarProduct> get listOfOilFilters => _listOfOilFilters;
  List<CarProduct> get listofAirFilters => _listofAirFilters;
  List<CarProduct> get listofCarOil => _listofCarOil;
  ModelPreferencesProvider() : super([]);

  Future<void> fetchPreferedProducts(String car_id, String model_id) async {
    _listOfOilFilters.clear();
    _listofAirFilters.clear();
    _listofCarOil.clear();

    try {
      final response = await http.get(Uri.parse(
          "http://localhost:3000/api/get_model_preferences/$car_id/$model_id"));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData is List) {
          for (var item in jsonData) {
            // var list =
            //     listofAirFilters.add(item['modelProducts']['Air_Filter']);

            var Oilfilters =
                FilterFromObject(item['modelProducts']['Oil_Filter']);

            _listOfOilFilters = Oilfilters;

            var Airfilters =
                FilterFromObject(item['modelProducts']['Air_Filter']);

            _listofAirFilters = Airfilters;

            var CarOils = FilterFromObject(item['modelProducts']['Car_Oil']);

            _listofCarOil = CarOils;

            // FilterAirfilters(item['modelProducts']['Air_Filter']);
            // print(item['modelProducts']['Car_Oil']);

            // listOfOilFilters.add(item['modelProducts']['Oil_Filter']);
            // listofCarOil.add(item['modelProducts']['Oil_Filter']);
          }
        }
      }
    } catch (e) {
      print("Error $e");
    }
  }

  List<CarProduct> FilterFromObject(dynamic Object) {
    // print(ObjectOFOilFilters['first_priority']['product_name']);

    // var product_id = ObjectOFOilFilters['first_priority']['product_name'];

    List<CarProduct> Priorityproducts = [];

    var firstPriortyProduct = CarProduct(
        product_id: Object['first_priority']['_id'],
        product_name: Object['first_priority']['product_name'],
        price: Object['first_priority']['price'],
        description: Object['first_priority']['decription'],
        category: Object['first_priority']['category'],
        imgUrl: Object['first_priority']['imgUrl'],
        prioirty: 1);

    var secondPriortyProduct = CarProduct(
        product_id: Object['second_priority']['_id'],
        product_name: Object['second_priority']['product_name'],
        price: Object['second_priority']['price'],
        description: Object['second_priority']['decription'],
        category: Object['second_priority']['category'],
        imgUrl: Object['second_priority']['imgUrl'],
        prioirty: 2);

    var thridPriortyProduct = CarProduct(
        product_id: Object['third_priority']['_id'],
        product_name: Object['third_priority']['product_name'],
        price: Object['third_priority']['price'],
        description: Object['third_priority']['decription'],
        category: Object['third_priority']['category'],
        imgUrl: Object['third_priority']['imgUrl'],
        prioirty: 3);

    Priorityproducts.add(firstPriortyProduct);
    Priorityproducts.add(secondPriortyProduct);
    Priorityproducts.add(thridPriortyProduct);

    return Priorityproducts;
  }

  // void FilterAirfilters(dynamic ObjectOFAirFilters) {
  //   print(ObjectOFAirFilters['first_priority']['product_name']);

  //   var product_id = ObjectOFAirFilters['first_priority']['product_name'];

  //   var firstPriortyProduct = CarProduct(
  //       product_id: ObjectOFAirFilters['first_priority']['_id'],
  //       product_name: ObjectOFAirFilters['first_priority']['product_name'],
  //       price: ObjectOFAirFilters['first_priority']['price'],
  //       description: ObjectOFAirFilters['first_priority']['decription'],
  //       category: ObjectOFAirFilters['first_priority']['category'],
  //       imgUrl: ObjectOFAirFilters['first_priority']['imgUrl'],
  //       prioirty: 1);

  //   var secondPriortyProduct = CarProduct(
  //       product_id: ObjectOFAirFilters['second_priority']['_id'],
  //       product_name: ObjectOFAirFilters['second_priority']['product_name'],
  //       price: ObjectOFAirFilters['second_priority']['price'],
  //       description: ObjectOFAirFilters['second_priority']['decription'],
  //       category: ObjectOFAirFilters['second_priority']['category'],
  //       imgUrl: ObjectOFAirFilters['second_priority']['imgUrl'],
  //       prioirty: 2);

  //   var thridPriortyProduct = CarProduct(
  //       product_id: ObjectOFAirFilters['third_priority']['_id'],
  //       product_name: ObjectOFAirFilters['third_priority']['product_name'],
  //       price: ObjectOFAirFilters['third_priority']['price'],
  //       description: ObjectOFAirFilters['third_priority']['decription'],
  //       category: ObjectOFAirFilters['third_priority']['category'],
  //       imgUrl: ObjectOFAirFilters['third_priority']['imgUrl'],
  //       prioirty: 3);

  //   _listofAirFilters.add(firstPriortyProduct);
  //   _listofAirFilters.add(secondPriortyProduct);
  //   _listofAirFilters.add(thridPriortyProduct);
  // }
}

final modelPreferencesProvider =
    StateNotifierProvider<ModelPreferencesProvider, List<dynamic>>((ref) {
  return ModelPreferencesProvider();
});
