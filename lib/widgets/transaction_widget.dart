import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/exports/exports.dart';

class TransactionWidget extends StatelessWidget {
  final int index;
  final String status;

  const TransactionWidget({super.key, this.index = 0, this.status = 'Paid'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? const Color.fromARGB(255, 255, 255, 255)
            : Colors.white12,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade300
              : Colors.white12,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color.fromARGB(255, 245, 245, 245)
                : Colors.white12,
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/imgs/interest.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'QuicCredit',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const TextSpan(
                          text: ' \n ',
                        ),
                        TextSpan(
                          text: DateFormat.yMMMd()
                              .format(DateTime.now().toLocal()),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 0.5, color: Colors.grey.shade400),
                  ),
                ),
                child: status == 'Paid'
                    ? const Icon(
                        Icons.done,
                        color: Colors.blue,
                        size: 20.0,
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 20.0,
                      ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'UGX 10000',
                  style: TextStyle(
                      color: status == 'Paid' ? Colors.black : Colors.red,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'QuicCredit',
                  style: TextStyle(color: Colors.blueGrey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
