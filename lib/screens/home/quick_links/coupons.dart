import 'package:flutter/material.dart';

class CouponPage extends StatelessWidget {
  CouponPage({super.key});
  final List<Coupon> coupons = [
    Coupon(code: 'SAVE10', value: 10.0, expiryDate: DateTime(2024, 12, 31)),
    Coupon(code: 'CASH20', value: 20.0, expiryDate: DateTime(2024, 11, 30)),
    Coupon(code: 'BONUS50', value: 50.0, expiryDate: DateTime(2024, 10, 15)),
    Coupon(code: 'MEGA100', value: 100.0, expiryDate: DateTime(2024, 9, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Coupons'),
      ),
      body: ListView.builder(
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return CouponCard(coupon: coupons[index]);
        },
      ),
    );
  }
}

class Coupon {
  final String code;
  final double value;
  final DateTime expiryDate;

  Coupon({required this.code, required this.value, required this.expiryDate});
}

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({Key? key, required this.coupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue.shade700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'COUPON',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${coupon.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Code: ${coupon.code}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Expires: ${_formatDate(coupon.expiryDate)}'),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Implement coupon usage logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Coupon ${coupon.code} applied!')),
                      );
                    },
                    child: Text('Use Coupon'),
                    style: ElevatedButton.styleFrom(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
