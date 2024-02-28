import 'package:flutter/material.dart';
import 'package:ecommerce_appe/models/cart_orders_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dummyCartOrders.length,
              itemBuilder: (context, index) {
                final cartOrder = dummyCartOrders[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      leading: Image.network(
                        cartOrder.product.imgUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(cartOrder.product.name),
                      subtitle: Text(
                          '\$${cartOrder.totalPrice.toStringAsFixed(2)}'),
                      trailing: Text('Quantity: ${cartOrder.quantity}'),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${_calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  double _calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartOrder in dummyCartOrders) {
      totalPrice += cartOrder.totalPrice;
    }
    return totalPrice;
  }
}