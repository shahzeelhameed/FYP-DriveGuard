import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bro/providers/cartprovider.dart';
import 'package:bro/screens/bottoNavigation.dart';
import 'package:bro/styles/Light_Text.dart';
import 'package:bro/styles/bold_text.dart';
import 'package:bro/widgets/cart_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  ConsumerState<CartScreen> createState() => _CartState();
}

class _CartState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(cartProvider.notifier).loadUserCartFromHive();
  }

  @override
  Widget build(BuildContext context) {
    var cartItemList = ref.watch(cartProvider);
    var total_price_of_cart =
        ref.watch(cartProvider.notifier).total_price_of_cart;

    var isLoading = ref.watch(cartProvider.notifier).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: cartItemList.isEmpty
            ? Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Image.asset('lib/assets/logo/empty-cart.png')),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItemList.length,
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          cartItem: cartItemList[index],
                        );
                      }),
                  ListTile(
                    trailing: Light_Text(
                        text: '${cartItemList.length}', fontSize: 14),
                    leading: Light_Text(text: "Items", fontSize: 14),
                  ),
                  ListTile(
                    trailing: Light_Text(
                        text: '\PKR ${total_price_of_cart}', fontSize: 14),
                    leading: Light_Text(text: "Sub Total", fontSize: 14),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     BoldText(text: "Subtotal", fontSize: 15),
                        //     Light_Text(text: "\$ $subtotal", fontSize: 15)
                        //   ],
                        // ),
                        // const Gap(10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     BoldText(text: "Shipping cost", fontSize: 15),
                        //     Light_Text(text: "\$ $shippping_cost", fontSize: 15)
                        //   ],
                        // ),
                        // const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldText(text: "Total", fontSize: 20),
                            BoldText(
                                text: "\PKR ${total_price_of_cart}",
                                fontSize: 20),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
      bottomNavigationBar: cartItemList.isEmpty
          ? null
          : ElevatedButton(
              onPressed: () {
                ref.read(cartProvider.notifier).checkout(context);

                // if (isPlaced) {
                //   showOrderPlacedDialog(context);
                // } else {
                //   print("Order didnot placed");
                // }
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 40),
                  backgroundColor: const Color.fromRGBO(150, 117, 250, 1)),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Checkout"),
            ),
    );
  }
}
