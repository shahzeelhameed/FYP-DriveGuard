import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bro/Hive/cart_item_model.dart';
import 'package:bro/Hive/user_cart_model.dart';
import 'package:bro/data/CartItemModel.dart';
import 'package:bro/screens/EditProfile.dart';
import 'package:bro/screens/UserProfile.dart';
import 'package:bro/screens/bottoNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// Cart State Notifier
class CartNotifier extends StateNotifier<List<ProductCartItem>> {
  double _total_price_of_cart = 0.00;

  get total_price_of_cart => _total_price_of_cart;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CartNotifier() : super([]);

  // Add item to the cart
  Future<void> addItem(BuildContext context, ProductCartItem cartItem) async {
    var isContains =
        state.any((product) => product.product_id == cartItem.product_id);

    if (!isContains) {
      state = [...state, cartItem];
      print("Item added to cart");
      showDialogbox(context, "Added to Cart", DialogType.success);
      calculateTotalPrice();
      _updateHive();
    } else {
      print("Item Removed");

      removeItem(cartItem);

      showDialogbox(context, "Removed", DialogType.error);
    }
  }

  void removeItem(ProductCartItem cartItem) {
    state =
        state.where((item) => item.product_id != cartItem.product_id).toList();

    calculateTotalPrice();
    _updateHive();
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    state = state.map((item) {
      if (item.product_id == productId) {
        return item.copyWith(
          initial_quantity: newQuantity,
          total_price: item.price * newQuantity,
        );
      } else {
        return item;
      }
    }).toList();

    calculateTotalPrice();
    _updateHive();
  }

  Future<void> calculateTotalPrice() async {
    double total = 0;
    state.forEach((item) {
      total += item.total_price;
    });
    _total_price_of_cart = total;
    _updateHive();
  }

  // void clearCart() {
  //   state = [];
  //   _updateHive();
  // }

  Future<void> checkout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');

    if (state.isEmpty) {
      print('state is empty');
    }

    _isLoading = true;
    try {
      final requestBody = {
        "order_products": state
            .map((e) =>
                {'product_id': e.product_id, 'quantity': e.initial_quantity})
            .toList(),
        "user_id": userId,
        "total_price": total_price_of_cart,
        "payment_method": 'Cash on Delivery'
      };

      final response = await http.post(
        Uri.parse('http://localhost:3000/api/create-order'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode(requestBody),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        var box = Hive.box<UserCart>('userCartBox');
        box.delete(userId);
        state = [];
        _isLoading = false;

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Your Order Placed',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          transitionAnimationDuration: const Duration(milliseconds: 500),
          autoHide: const Duration(seconds: 2),
          onDismissCallback: (type) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BotttomNavigationScreen(),
              )),
        ).show();
      }

      if (response.statusCode == 401) {
        print("Address not given");
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          headerAnimationLoop: false,
          animType: AnimType.bottomSlide,
          title: 'Please upload your address in your profile',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          btnOkColor: Colors.blue,
          autoHide: const Duration(seconds: 2),
        ).show();
      }
    } catch (error) {
      print(error);
    } finally {
      _isLoading = false;
    }
  }

  void loadUserCartFromHive() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');

    if (userId != null) {
      var box = Hive.box<UserCart>('userCartBox');
      var userCart = box.get(userId);
      if (userCart != null) {
        state = userCart.cart_items.map((cartitem) {
          return ProductCartItem(
              product_id: cartitem.product_id,
              product_name: cartitem.name,
              initial_quantity: cartitem.initial_quantity,
              imgUrl: cartitem.imgUrl,
              price: cartitem.price);
        }).toList();
        _total_price_of_cart = userCart.total_price_of_cart;
      } else {
        state = [];
      }
    }
  }

  void _updateHive() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    final userCart = UserCart();

    userCart.user_id = userId!;
    userCart.cart_items = state.map((e) {
      return CartItem(e.product_id, e.product_name, e.initial_quantity, e.price,
          e.total_price, e.imgUrl);
    }).toList();
    userCart.total_price_of_cart = _total_price_of_cart;

    // Get the Hive box only once
    var box = Hive.box<UserCart>('userCartBox');

    box.put(userId, userCart);
  }
}

void showDialogbox(BuildContext context, String title, DialogType dialogType) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    headerAnimationLoop: false,
    animType: AnimType.topSlide,
    title: title,
    buttonsTextStyle: const TextStyle(color: Colors.black),
    transitionAnimationDuration: const Duration(milliseconds: 200),
    autoHide: const Duration(seconds: 2),
  ).show();
}

// Cart Notifier Provider
final cartProvider =
    StateNotifierProvider<CartNotifier, List<ProductCartItem>>((ref) {
  return CartNotifier();
});
