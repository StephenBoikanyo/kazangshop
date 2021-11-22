import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanzangshop/components/components.dart';
import 'package:kanzangshop/screens/product_details_screen.dart';
import 'package:kanzangshop/services/networking.dart';
import 'package:kanzangshop/services/services.dart';

class HomeScreen extends StatefulWidget {
  late final String sessionid;
  HomeScreen({required this.sessionid});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Productmodel>> getProducts() async {
    NetworkHelper networkHelper = new NetworkHelper();
    var productList = await networkHelper.getProductList(widget.sessionid);
    List<Productmodel> products = [];

    for (var p in productList) {
      Productmodel product = Productmodel(
          id: p['id'], name: p['name'], summary: p['summary'], logo: p['logo']);
      products.add(product);
    }
    print(products.length);
    return products;
  }

  Icon searchIcon = const Icon(Icons.search);
  Widget searchBar = const Text('KazangShop');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KazangShop'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: searchIcon,
              onPressed: () {
                setState(() {
                  if (searchIcon.icon == Icons.search) {
                    searchIcon = const Icon(Icons.cancel);
                    searchBar = const ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                      // h*AHRiUC5pnM#M
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Product...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                });
              },
            )
          ],
        ),
        body: Container(
            child: Card(
          child: FutureBuilder<List<Productmodel>>(
              future: getProducts(),
              builder: (context, snaphot) {
                if (snaphot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading'),
                    ),
                  );
                } else {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 4 / 6,
                      ),
                      itemCount: snaphot.data!.length,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            productImage: snaphot.data![index].logo,
                            productTitle: snaphot.data![index].name,
                            productSummary: snaphot.data![index].summary,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product: snaphot.data![index],
                                        sessionid: widget.sessionid))));
                      });
                }
              }),
        )));
  }
}

// class ProductListStream extends StatelessWidget {
//   const ProductListStream({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Productmodel>(
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.green,
//             ),
//           );
//         } else {
//           return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 4 / 6,
//               ),
//               itemCount: snaphot.data!.length,
//               itemBuilder: (context, index) {
//                 return ProductTile(
//                     productImage: snaphot.data![index].logo,
//                     productTitle: snaphot.data![index].name,
//                     productSummary: snaphot.data![index].summary,
//                     onPressed: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ProductDetails(
//                                 product: snaphot.data![index],
//                                 sessionid: widget.sessionid))));
//               });
//         }
//       },
//     );
//   }
// }
