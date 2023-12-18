import 'package:flutter/material.dart';

class ReportContainerWidget extends StatelessWidget {
  final String name;
  final String money;
  final String phone;
  final String address;
  const ReportContainerWidget(
      {super.key,
      required this.name,
      required this.phone,
      required this.address,
      required this.money});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 247, 210, 222),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                "\$ $money",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
          Text(
            phone,
          ),
          Text(address)
        ],
      ),
    );
  }
}
