import 'package:flutter/material.dart';
import 'package:quic_credit/exports/exports.dart';

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
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text('Available Coupons'),
        forceMaterialTransparency: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset("assets/svgs/no-coupons.svg",
                    height: 250)),
            const SizedBox(height: 20),
            const Text(
              'No Coupons Available',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: constraints.maxHeight * 0.25),
          ],
        );
      }),
      //    ListView.builder(
      //     itemCount: coupons.length,
      //     itemBuilder: (context, index) {
      //       return CouponCard(coupon: coupons[index]);
      //     },
      //   ),
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

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue.shade700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'COUPON',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${coupon.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Code: ${coupon.code}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text('Expires: ${_formatDate(coupon.expiryDate)}'),
                  const SizedBox(height: 15),
                  OutlinedButton(
                    onPressed: () {
                      // Implement coupon usage logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Coupon ${coupon.code} applied!')),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Colors.blue, width: 0.5),
                    ),
                    child: const Text(
                      'Use Coupon',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
