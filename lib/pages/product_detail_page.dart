import 'package:app_challenge/models/report_model.dart';
import 'package:app_challenge/pages/report_page.dart';
import 'package:app_challenge/providers/home_provider.dart';
import 'package:app_challenge/utils/extensions.dart';
import 'package:app_challenge/widgets.dart/alertDialog.dart';
import 'package:app_challenge/widgets.dart/product_colors.dart';
// import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets.dart/app_bar_icon.dart';

class ProductDetailPage extends StatelessWidget {
  final int id;
  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final HomePageProvider proDetail = context.read<HomePageProvider>();
    var data = proDetail.findProdById(id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const AppBarIconWidget(icon: Icons.arrow_back_ios)
            // const Icon(
            //   FlatIcons.con_left_arrow_5_a,
            // )
            ),
        title: const Text("Maybelline Fit Mee"),
        actions: const [
          AppBarIconWidget(
            icon: Icons.shopping_cart_outlined,
          )
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            data.imageLink,
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 210, 222),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (data.productColors != null &&
                        data.productColors!.isNotEmpty)
                      for (int i = 0; i < data.productColors!.length; i++)
                        ProductColorsWidget(
                            color: data.productColors![i].color
                                .toString()
                                .toColor()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Text(data.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.productType,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 25,
                            initialRating:
                                double.tryParse(data.rating.toString()) ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.purpleAccent,
                              size: 1,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        data.description,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                    color: Colors.pink,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${data.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 13,
                              )),
                          const Text("1"),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                size: 13,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              fixedSize:
                                  const MaterialStatePropertyAll(Size(70, 50)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.purple)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.7,
                                        child: Form(
                                          key: proDetail.createformKey,
                                          child: ListView(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 60),
                                                child: Text(
                                                  "Delivery Info",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              AlertDialogWidget(
                                                validator: (_) =>
                                                    _?.isEmpty == true
                                                        ? "Requried"
                                                        : null,
                                                onEditingComplete: () {
                                                  proDetail.phoneFocusNode
                                                      .requestFocus();
                                                },
                                                controller: proDetail
                                                    .nameEditingController,
                                                maxLines: 1,
                                                name: 'Name',
                                              ),
                                              AlertDialogWidget(
                                                validator: (_) =>
                                                    _?.isEmpty == true
                                                        ? "Requried"
                                                        : null,
                                                focusNode:
                                                    proDetail.phoneFocusNode,
                                                onEditingComplete: () {
                                                  proDetail.addressFocusNode
                                                      .requestFocus();
                                                },
                                                controller: proDetail
                                                    .phoneEditingController,
                                                maxLines: 1,
                                                name: 'Phone No',
                                              ),
                                              AlertDialogWidget(
                                                validator: (_) =>
                                                    _?.isEmpty == true
                                                        ? "Requried"
                                                        : null,
                                                focusNode:
                                                    proDetail.addressFocusNode,
                                                controller: proDetail
                                                    .addressEditingController,
                                                name: 'Address',
                                                maxLines: 3,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              UnconstrainedBox(
                                                  child: SizedBox(
                                                width: 130,
                                                height: 45,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15))),
                                                        backgroundColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors.purple)),
                                                    onPressed: () async {
                                                      if (proDetail
                                                              .createformKey
                                                              .currentState
                                                              ?.validate() ==
                                                          true) {
                                                        await proDetail.addDataToFirebase(ReportModel(
                                                            name: proDetail
                                                                .nameEditingController
                                                                .text,
                                                            phone: proDetail
                                                                .phoneEditingController
                                                                .text,
                                                            address: proDetail
                                                                .addressEditingController
                                                                .text,
                                                            price: data.price
                                                                .toString()));
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const ReportPage()));
                                                        proDetail
                                                            .nameEditingController
                                                            .clear();
                                                        proDetail
                                                            .phoneEditingController
                                                            .clear();
                                                        proDetail
                                                            .addressEditingController
                                                            .clear();
                                                      }
                                                    },
                                                    child: const Text(
                                                      "ORDER",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                          child: const Text(
                            "Cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
