import 'package:app_challenge/models/report_model.dart';
import 'package:app_challenge/widgets.dart/app_bar_icon.dart';
import 'package:app_challenge/widgets.dart/report_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const AppBarIconWidget(
              icon: Icons.arrow_back_ios,
            )
            // const Icon(FlatIcons.con_left_arrow_5_a),
            ),
        title: const Text("Report"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('report').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ReportModel> data = snapshot.data!.docs
              .map((doc) => ReportModel.fromJson(doc))
              .toList();
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) =>
                ReportContainerWidget(
                    name: data[index].name,
                    phone: data[index].phone,
                    address: data[index].address,
                    money: data[index].price),
          );
        },
      ),
    );
  }
}
