import 'package:clone_prjt/view/order_screen/conformation_screen.dart';
import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String itemName;
  final String price;

  const PlaceOrderScreen({
    Key? key,
    required this.itemName,
    required this.price,
  }) : super(key: key);

  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  int quantity = 1;
  double itemPrice = 279.00;
  double deliveryCharge = 50.00;
  double taxes = 5.00;
  double total = 334.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eat Healthy"),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text('Delivery at Home - Flat no: 301, SVR Enclave'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.itemName, style: TextStyle(fontSize: 18)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                          total = itemPrice * quantity + deliveryCharge + taxes;
                        });
                      },
                    ),
                    Text('$quantity'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                          total = itemPrice * quantity + deliveryCharge + taxes;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Text('Add On: Mushroom'),
            SizedBox(height: 16),
            Text('Offers', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Save ₹59.70 with code ZOMSAFETY',
                style: TextStyle(color: Colors.red)),
            Divider(),
            Text('Please tip your valet', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TipButton(amount: 20),
                TipButton(amount: 30),
                TipButton(amount: 50),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Custom'),
                ),
              ],
            ),
            Divider(),
            Text('Item Total: ₹$itemPrice'),
            Text('Delivery Charge: ₹$deliveryCharge'),
            Text('Taxes: ₹$taxes'),
            Text('Donate ₹3 to Feeding India Foundation',
                style: TextStyle(color: Colors.red)),
            Divider(),
            Text('Grand Total: ₹$total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPlacedScreen(),
                  ),
                );
              },
              child: Text('Place Order'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            Text(
                'Orders once placed cannot be cancelled and are non-refundable.',
                style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

class TipButton extends StatelessWidget {
  final int amount;

  TipButton({required this.amount});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('₹$amount'),
    );
  }
}
