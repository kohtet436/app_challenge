import 'package:app_challenge/pages/product_detail_page.dart';
import 'package:app_challenge/providers/home_provider.dart';
import 'package:app_challenge/widgets.dart/app_bar_icon.dart';
import 'package:app_challenge/widgets.dart/products_widget.dart';
import 'package:app_challenge/widgets.dart/search_Box.dart';
// import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomePageProvider>(context, listen: false)
        .getProductData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final proMdl = Provider.of<HomePageProvider>(context);
    return proMdl.loading == true
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              foregroundColor: Colors.black,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ReportPage()));
                  },
                  child: const AppBarIconWidget(
                    icon: Icons.menu,
                  )
                  // const Icon(FlatIcons.menu_1)
                  ),
              title: Text(proMdl.data?[0].brand.toString() ?? ""),
              actions: const [
                AppBarIconWidget(icon: Icons.shopping_cart_outlined),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SearchBoxWidget(),
                  Expanded(
                      child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (0.6),
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                      id: proMdl.data![index].id,
                                    )));
                          },
                          child: ProductsWidget(
                            image: proMdl.data?[index].imageLink ??
                                "https://pixabay.com/vectors/shoes-footwear-sneakers-fashion-153310/",
                            name: proMdl.data![index].name,
                            price: proMdl.data![index].price,
                            productType: proMdl.data![index].productType,
                          ));
                    },
                  ))
                ],
              ),
            ),
          );
  }
}
